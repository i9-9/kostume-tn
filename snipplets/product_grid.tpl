{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% if products and pages.is_last %}
	<div class="last-page" style="display:none;"></div>
{% endif %}

{# Filtrar productos de Private Sale en búsqueda #}
{% set product_counter = 0 %}
{% for product in products %}
    {# Verificar si el producto pertenece a Private Sale #}
    {% set is_private_sale = false %}
    {% for cat in product.categories %}
        {% if 'private' in cat.name|lower or 'private-sale' in cat.url|lower %}
            {% set is_private_sale = true %}
        {% endif %}
    {% endfor %}
    
    {# Solo mostrar si NO es de Private Sale (en búsqueda) o si estamos en cualquier otra página #}
    {% if template != 'search' or not is_private_sale %}
        {% set product_counter = product_counter + 1 %}
        {% if product_counter % 4 == 1 %}
            <div class="product-row row">
        {% endif %}
        {% include 'snipplets/single_product.tpl' %}
        {% if product_counter % 4 == 0 or loop.last %}
            </div>
        {% endif %}
    {% endif %}
{% endfor %}
