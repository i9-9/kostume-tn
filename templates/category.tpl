{% set show_filters = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}

{# Private Sale: traer todos los ítems en una página (evita quedar en 12 por paginación/infinite scroll).
   Condición inline: en Twig TN el {% set %} dentro de {% if %} no propaga al scope externo. #}
{% if category and (('private sale' in (category.name | default('') | lower)) or ((category.name | default('') | lower) == 'private') or ('private-sale' in (category.url | default('') | lower))) %}
    {% paginate by 50 %}
{% else %}
    {% paginate by settings.category_quantity_products %}
{% endif %}
{% set show_help = not has_products %}
{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{% if show_help %}
    {% include 'snipplets/defaults/show_help_category.tpl' %}
{% else %}
    <div class="category-content">
        {% snipplet "page-header.tpl" with page_header_title = category.name %}
        <div class="container" style="width: 100%; padding-left: 0; padding-right: 0;">       
            <div class="row">
                <div class="visible-xs col-xs-12">
                    {% include "snipplets/product-grid/sidebar-filters.tpl" with {'applied_filters': true} %}
                </div>
                {# ** the following if rule adds a full width class in case there is no sidebar that contains properties to filter or categories ** #}
                <div class="col-xs-12 col-sm-10 {% if show_filters %}col-lg-10 col-md-10 p-none{% else %}col-lg-12 col-md-12{% endif %} category-grid-container" data-store="category-grid-{{ category.id }}">
                    {% if show_filter_error %}
                        <div class="text-center m-bottom">
                            <h4 class="text-uppercase">{{ "No tenemos productos para mostrarte :(" | translate }}</h4>
                            <h5>{{ "Quizás encuentres lo que buscabas en los productos debajo." | translate }}</h5>
                        </div>
                    {% endif %}   
                    {% if products %}
                        <div class="{% if settings.infinite_scrolling and not pages.is_last and products%} js-infinite-grid {% endif %} js-masonry-grid category-products-grid">
                            {% snipplet "product_grid.tpl" %}
                        </div>
                        {% snipplet "product-grid/pagination.tpl" %}
                    {% else %}
                        {#  No products message  #}
                        <div class="container-fluid" style="padding: 0; text-transform: uppercase;">
                            <div class="alert alert-info" style="background: transparent; color: white;">
                                {% set no_products_message = has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente" %}
                                <p>{{no_products_message | translate}}</p>
                            </div>           
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
{% endif %} 

{% snipplet "product-grid/mobile-filters.tpl" %}

{#  **** Banners ****  #}

{% if "banner-products.jpg" | has_custom_image %}
    {% include 'snipplets/banners/banner-categories.tpl' %}  
{% endif %}
