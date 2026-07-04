#!/usr/bin/env python3
"""
Script de deploy automático vía FTP para Tienda Nube
Uso: python3 deploy.py [archivos...]
"""

import os
import sys
import json
from ftplib import FTP, error_perm
from pathlib import Path

# Intentar importar FTPS (FTP sobre TLS)
try:
    from ftplib import FTP_TLS
    FTPS_AVAILABLE = True
except ImportError:
    FTPS_AVAILABLE = False

# Colores para la terminal
class Colors:
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    END = '\033[0m'
    BOLD = '\033[1m'

def print_success(msg):
    print(f"{Colors.GREEN}✓ {msg}{Colors.END}")

def print_error(msg):
    print(f"{Colors.RED}✗ {msg}{Colors.END}")

def print_info(msg):
    print(f"{Colors.BLUE}ℹ {msg}{Colors.END}")

def print_warning(msg):
    print(f"{Colors.YELLOW}⚠ {msg}{Colors.END}")

def env_first(*names, default=None):
    """Devuelve el primer valor de entorno disponible entre varios nombres."""
    for name in names:
        value = os.environ.get(name)
        if value not in (None, ''):
            return value
    return default


def env_bool(*names, default=True):
    value = env_first(*names)
    if value is None:
        return default
    return str(value).strip().lower() in ('1', 'true', 'yes', 'y', 'on')


def env_int(*names, default=None):
    value = env_first(*names)
    if value is None:
        return default
    try:
        return int(value)
    except ValueError:
        return default


def config_from_env():
    """Construye la config FTP desde variables de entorno."""
    host = env_first(
        'FTP_HOST', 'FTP_HOSTNAME', 'TN_FTP_HOST', 'TIENDA_NUBE_FTP_HOST',
        'NUVEMSHOP_FTP_HOST', 'KOSTUME_FTP_HOST', 'HOST'
    )
    username = env_first(
        'FTP_USERNAME', 'FTP_USER', 'TN_FTP_USERNAME', 'TN_FTP_USER',
        'TIENDA_NUBE_FTP_USERNAME', 'NUVEMSHOP_FTP_USERNAME', 'KOSTUME_FTP_USERNAME',
        'USERNAME', 'USER'
    )
    password = env_first(
        'FTP_PASSWORD', 'FTP_PASS', 'TN_FTP_PASSWORD', 'TIENDA_NUBE_FTP_PASSWORD',
        'NUVEMSHOP_FTP_PASSWORD', 'KOSTUME_FTP_PASSWORD', 'PASSWORD', 'PASS'
    )

    if not host or not username or not password:
        return None

    return {
        'host': host,
        'port': env_int('FTP_PORT', 'TN_FTP_PORT', default=21),
        'username': username,
        'password': password,
        'remote_path': env_first(
            'FTP_REMOTE_PATH', 'FTP_PATH', 'TN_FTP_REMOTE_PATH', 'TN_FTP_PATH',
            'TIENDA_NUBE_FTP_REMOTE_PATH', default='/'
        ),
        'use_passive': env_bool('FTP_USE_PASSIVE', 'TN_FTP_USE_PASSIVE', default=True),
        'use_tls': env_bool('FTP_USE_TLS', 'TN_FTP_USE_TLS', default=True),
        'timeout': env_int('FTP_TIMEOUT', 'TN_FTP_TIMEOUT', default=30),
    }


def is_placeholder_config(config):
    placeholders = {
        'host': {'tu-servidor-ftp.com'},
        'username': {'tu-usuario'},
        'password': {'tu-contraseña', 'tu-contrasena'},
    }
    return (
        config.get('host') in placeholders['host']
        or config.get('username') in placeholders['username']
        or config.get('password') in placeholders['password']
    )


def load_config():
    """Carga la configuración FTP desde env o ftp_config.json."""
    env_config = config_from_env()
    if env_config:
        print_info("Usando credenciales FTP desde variables de entorno")
        return env_config

    config_file = Path(__file__).parent / 'ftp_config.json'

    if config_file.exists():
        with open(config_file, 'r') as f:
            file_config = json.load(f)
        if not is_placeholder_config(file_config):
            print_info("Usando credenciales FTP desde ftp_config.json")
            return file_config
        print_warning("ftp_config.json tiene valores placeholder")

    print_error("No se encontraron credenciales FTP válidas")
    print_info("Configurá variables de entorno del Cloud Agent:")
    print("  FTP_HOST, FTP_USERNAME, FTP_PASSWORD, FTP_REMOTE_PATH")
    print_info("O completá ftp_config.json en la raíz del proyecto")

    if not config_file.exists():
        create_config_template(config_file)

    sys.exit(1)

def create_config_template(config_file):
    """Crea un template de configuración"""
    template = {
        "host": "tu-servidor-ftp.com",
        "port": 21,
        "username": "tu-usuario",
        "password": "tu-contraseña",
        "remote_path": "/",
        "use_passive": True,
        "use_tls": True,
        "timeout": 30
    }
    
    with open(config_file, 'w') as f:
        json.dump(template, f, indent=2)

def get_files_to_upload(files_arg=None):
    """Determina qué archivos subir"""
    if files_arg:
        # Archivos específicos pasados como argumentos
        files = [Path(f) for f in files_arg if Path(f).exists()]
        if not files:
            print_error("No se encontraron los archivos especificados")
            sys.exit(1)
        return files
    
    # Por defecto, subir archivos modificados según git
    try:
        import subprocess
        result = subprocess.run(
            ['git', 'diff', '--name-only', 'HEAD'],
            capture_output=True,
            text=True,
            check=True
        )
        modified = [Path(f.strip()) for f in result.stdout.split('\n') if f.strip()]
        
        if not modified:
            print_warning("No hay archivos modificados según git")
            print_info("Usa: python3 deploy.py archivo1.tpl archivo2.tpl")
            sys.exit(0)
        
        return modified
    except (subprocess.CalledProcessError, FileNotFoundError):
        print_warning("Git no disponible o no hay cambios")
        print_info("Usa: python3 deploy.py archivo1.tpl archivo2.tpl")
        sys.exit(0)

def upload_file(ftp, local_path, remote_path):
    """Sube un archivo al servidor FTP"""
    try:
        # Crear directorios remotos si no existen
        remote_dir = os.path.dirname(remote_path)
        if remote_dir and remote_dir != '/':
            try:
                ftp.cwd(remote_dir)
            except error_perm:
                # Intentar crear el directorio
                parts = remote_dir.strip('/').split('/')
                current_path = ''
                for part in parts:
                    if part:
                        current_path += '/' + part
                        try:
                            ftp.cwd(current_path)
                        except error_perm:
                            try:
                                ftp.mkd(current_path)
                                ftp.cwd(current_path)
                            except error_perm:
                                pass
        
        # Volver al directorio base
        ftp.cwd('/')
        if config['remote_path'] != '/':
            ftp.cwd(config['remote_path'])
        
        # Subir el archivo
        with open(local_path, 'rb') as f:
            ftp.storbinary(f'STOR {remote_path}', f)
        
        return True
    except Exception as e:
        print_error(f"Error subiendo {local_path}: {str(e)}")
        return False

def main():
    global config
    config = load_config()
    
    # Verificar si hay flag --yes o -y
    skip_confirmation = '--yes' in sys.argv or '-y' in sys.argv
    if skip_confirmation:
        sys.argv = [arg for arg in sys.argv if arg not in ['--yes', '-y']]
    
    # Obtener archivos a subir
    files_to_upload = get_files_to_upload(sys.argv[1:] if len(sys.argv) > 1 else None)
    
    if not files_to_upload:
        print_error("No hay archivos para subir")
        sys.exit(1)
    
    # Mostrar archivos que se van a subir
    print_info(f"Archivos a subir ({len(files_to_upload)}):")
    for f in files_to_upload:
        print(f"  - {f}")
    
    # Confirmar (a menos que se use --yes)
    if not skip_confirmation:
        response = input(f"\n{Colors.YELLOW}¿Continuar con el deploy? (s/n): {Colors.END}")
        if response.lower() not in ['s', 'si', 'sí', 'y', 'yes']:
            print_info("Deploy cancelado")
            sys.exit(0)
    else:
        print_info("Modo automático (--yes activado)")
    
    # Conectar al servidor FTP
    print_info(f"Conectando a {config['host']}...")
    try:
        use_tls = config.get('use_tls', True)
        
        if use_tls and FTPS_AVAILABLE:
            ftp = FTP_TLS()
            ftp.set_pasv(config.get('use_passive', True))
            ftp.set_debuglevel(0)  # Cambiar a 2 para debug detallado
            ftp.connect(config['host'], config.get('port', 21), timeout=config.get('timeout', 30))
            
            # Intentar login
            try:
                ftp.login(config['username'], config['password'])
            except error_perm as e:
                if '530' in str(e) or 'Authentication failed' in str(e):
                    print_error("Error de autenticación. Verifica usuario y contraseña en ftp_config.json")
                    print_info("Asegúrate de que las credenciales sean correctas")
                raise
            
            # Proteger el canal de datos
            try:
                ftp.prot_p()
            except:
                pass  # Algunos servidores no requieren prot_p explícito
            
            print_success("Conexión FTPS (TLS) establecida")
        else:
            ftp = FTP()
            ftp.set_pasv(config.get('use_passive', True))
            ftp.connect(config['host'], config.get('port', 21), timeout=config.get('timeout', 30))
            ftp.login(config['username'], config['password'])
            print_success("Conexión FTP establecida")
        
        # Cambiar al directorio remoto
        if config['remote_path'] != '/':
            try:
                ftp.cwd(config['remote_path'])
                print_info(f"Directorio remoto: {config['remote_path']}")
            except error_perm:
                print_warning(f"No se pudo cambiar al directorio {config['remote_path']}, usando raíz")
        
        # Subir archivos
        uploaded = 0
        failed = 0
        
        for local_file in files_to_upload:
            # Mantener la estructura de directorios relativa
            remote_file = str(local_file).replace('\\', '/')
            
            print_info(f"Subiendo {local_file}...")
            if upload_file(ftp, local_file, remote_file):
                print_success(f"✓ {local_file} subido correctamente")
                uploaded += 1
            else:
                failed += 1
        
        ftp.quit()
        
        # Resumen
        print(f"\n{Colors.BOLD}Resumen:{Colors.END}")
        print_success(f"Archivos subidos: {uploaded}")
        if failed > 0:
            print_error(f"Archivos fallidos: {failed}")
        
    except Exception as e:
        print_error(f"Error de conexión: {str(e)}")
        sys.exit(1)

if __name__ == '__main__':
    main()

