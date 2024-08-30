{% if template == 'home' %}
    {{ "Inicio" | translate }}
{% endif %}
{% if template == 'category' %}
    {{ category.name }}
{% endif %}
{% if template == 'page' %}
    {{ page.name }}
{% endif %}
{% if template == 'product' %}
    {{ product.name }}
{% endif %}
{% if template == 'cart' %}
	{{ "Carrito de Compras" | translate }}
{% endif %}
{% if template == 'contact' %}
    {{ "Contacto" | translate }}
{% endif %}
{% if template == 'search' %}
    {{ "Resultados de búsqueda" | translate }}
{% endif %}
{% if template == '404' %}
    {{ "La página no existe" | translate }}
{% endif %}
{% if template == 'account.login' %}
    {{ "Iniciar sesión" | translate }}
{% endif %}
{% if template == 'account.register' %}
    {{ "Crear cuenta" | translate }}
{% endif %}
{% if template == 'account.reset' %}
    {{ "Cambiar Contraseña" | translate }}
{% endif %}
{% if template == 'account.orders' %}
    {{ "Mi cuenta" | translate }}
{% endif %}
{% if template == 'account.info' %}
    {{ "Mi cuenta" | translate }}
{% endif %}
{% if template == 'account.address' %}
    {{ "Dirección" | translate }}
{% endif %}
{% if template == 'account.addresses' %}
    {{ "Mis direcciones" | translate }}
{% endif %}
{% if template == 'account.order' %}
    {{ "Orden {1}" | translate(order.number) }}
{% endif %}