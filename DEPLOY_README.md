# 🚀 Script de Deploy Automático FTP

Script para subir archivos automáticamente vía FTP desde Cursor, sin necesidad de usar Cyberduck manualmente.

## 📋 Configuración Inicial

1. **Edita `ftp_config.json`** con tus credenciales FTP:
   ```json
   {
     "host": "tu-servidor-ftp.com",
     "port": 21,
     "username": "tu-usuario",
     "password": "tu-contraseña",
     "remote_path": "/ruta/en/servidor",
     "use_passive": true,
     "timeout": 30
   }
   ```

2. **Para Tienda Nube**, el `remote_path` generalmente es:
   - `/themes/[ID_TU_TIENDA]/` o
   - `/` (raíz del servidor FTP)

## 🎯 Uso

### Opción 1: Subir archivos modificados (según git)
```bash
python3 deploy.py
```
Sube automáticamente todos los archivos que hayas modificado según git.

### Opción 2: Subir archivos específicos
```bash
python3 deploy.py snipplets/vip-protection.tpl templates/category.tpl
```

### Opción 3: Desde Cursor
1. Abre la terminal integrada (`` Ctrl+` `` o `Cmd+J`)
2. Ejecuta: `python3 deploy.py [archivos]`

## 📝 Ejemplos

```bash
# Subir solo los archivos de la protección VIP
python3 deploy.py snipplets/vip-protection.tpl templates/category.tpl

# Subir todos los cambios según git
python3 deploy.py

# Subir un archivo específico
python3 deploy.py static/css/custom-styles.scss.tpl
```

## 🔒 Seguridad

- `ftp_config.json` está en `.gitignore` - **NO se subirá al repositorio**
- Las credenciales quedan solo en tu máquina local
- Puedes compartir el script sin preocuparte por las credenciales

## ⚙️ Requisitos

- Python 3 (viene preinstalado en macOS)
- Acceso FTP a tu servidor de Tienda Nube

## 🐛 Solución de Problemas

**Error de conexión:**
- Verifica que las credenciales en `ftp_config.json` sean correctas
- Asegúrate de que el puerto sea el correcto (21 para FTP, 22 para SFTP)
- Verifica que el firewall no bloquee la conexión

**Archivos no encontrados:**
- Usa rutas relativas desde la raíz del proyecto
- Verifica que los archivos existan antes de subirlos

**Nota:** Este script usa FTP estándar. Si tu servidor requiere SFTP, avísame y creo una versión con SFTP.







