{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% if products and pages.is_last %}
	<div class="last-page" style="display:none;"></div>
{% endif %}

{# Private Sale: listar en /private-sale; en search se renderizan marcados y el JS elige público vs PS según sesión #}
{% set _on_ps_category = false %}
{% if template == 'category' and category %}
    {% set _ps_page_name = category.name | default('') | lower %}
    {% set _ps_page_url = category.url | default('') | lower %}
    {% if ('private sale' in _ps_page_name) or (_ps_page_name == 'private') or ('private-sale' in _ps_page_url) %}
        {% set _on_ps_category = true %}
    {% endif %}
{% endif %}
{% set _ps_in_search = template == 'search' %}

{% set product_counter = 0 %}
{% for product in products %}
    {% set is_private_sale %}{% include 'snipplets/helpers/is-private-sale.tpl' %}{% endset %}
    {% if _on_ps_category or _ps_in_search or not (is_private_sale|trim) %}
        {% set product_counter = product_counter + 1 %}
        {% if product_counter % 4 == 1 %}
            <div class="product-row row">
        {% endif %}
        {% include 'snipplets/single_product.tpl' %}
        {% if product_counter % 4 == 0 %}
            </div>
        {% endif %}
    {% endif %}
{% endfor %}
{% if product_counter % 4 != 0 %}
    </div>
{% endif %}
