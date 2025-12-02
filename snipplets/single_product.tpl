{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% set columns_list = settings.columns_quantity_products %}
{% if product.compare_at_price and product.compare_at_price > product.price %}
{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}
{% set has_color_variant = false %}
{% if settings.product_color_variants %}
    {% for variation in product.variations if variation.name in ['Color', 'Cor'] and variation.options | length > 1 %}
        {% set has_color_variant = true %}
    {% endfor %}
{% endif %}

{# Verificar si es producto de Private Sale por tags (más confiable en búsqueda) #}
{% set is_private_sale_product = false %}
{% for tag in product.tags %}
    {% if 'private-sale' in tag|lower or 'private' in tag|lower %}
        {% set is_private_sale_product = true %}
    {% endif %}
{% endfor %}
<div class="js-item-product js-masonry-item item-container{% if columns_list == 1 %} col-xs-12 col-sm-6 col-md-4 col-lg-4{% else %} col-xs-6 col-sm-4 col-md-3 col-lg-3{% endif %}{% if related_product %} item-container-related p-left-none-xs{% endif %}{% if is_private_sale_product %} js-private-sale-product{% endif %}" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}" {% if is_private_sale_product %}data-private-sale="true"{% endif %}>
    <div class="item">
        {% if settings.quick_view or settings.product_color_variants %}
            <div class="js-product-container js-quickshop-container{% if product.variations %} js-quickshop-has-variants{% endif %}" data-variants="{{ product.variants_object | json_encode }}" data-quickshop-id="quick{{ product.id }}" style="width: 100%;">
        {% endif %}
        <div class="item-image-container pull-left p-relative">
            {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}
            <a href="{{ product_url_with_selected_variant }}" class="js-stock-label overlay-no-stock" {% if product.has_stock %} style="display: none"{% endif %}>
                <h4 class="overlay-no-stock-text h6-xs">{{ "Sin stock" | translate }}</h4>
            </a>
            <div class="item-labels" data-store="product-item-labels">
                {% if product.free_shipping or product.compare_at_price or product.promotional_offer %}
                    {% if product.promotional_offer %}
                        <div class="product-label product-label-offer label label-accent {% if not product.display_price %} hidden {% endif %}" data-store="product-item-promotion-label">
                            {% if product.promotional_offer.script.is_percentage_off %}
                                <strong>{{ product.promotional_offer.parameters.percent * 100 }}%</strong> OFF
                            {% elseif product.promotional_offer.script.is_discount_for_quantity %}
                                <div>
                                    <h4 class="m-none"><strong>{{ product.promotional_offer.selected_threshold.discount_decimal_percentage * 100 }}% OFF</strong></h4>
                                    <div class="label-small">{{ "Comprando {1} o más." | translate(product.promotional_offer.selected_threshold.quantity) }}</div>
                                </div>
                            {% else %}
                                {% if store.country == 'BR' %}
                                    {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                                {% else %}
                                    {{ product.promotional_offer.script.type }}
                                {% endif %}
                            {% endif %}
                        </div>
                    {% elseif product.compare_at_price and product.compare_at_price > product.price %}
                        <div class="js-offer-label product-label product-label-offer label label-accent {% if not product.display_price %} hidden {% endif %}" data-store="product-item-offer-label">
                            <strong class="js-offer-percentage">{{ price_discount_percentage |round }}</strong>% OFF
                        </div>
                    {% endif %}

                    {% if product.free_shipping %}
                        <div class="label label-accent">
                            <span class="product-label-icon">
                                {% include "snipplets/svg/truck.tpl" with {'fa_custom_class' : 'svg-icon-background'} %}
                            </span>
                            <span class="product-label-text">
                                {{ "Gratis" | translate }}
                            </span>
                        </div>
                    {% endif %}
                {% endif %}
            </div>
            <span class="hidden" data-store="stock-product-{{ product.id }}-{% if product.has_stock %}{% if product.stock %}{{ product.stock }}{% else %}infinite{% endif %}{% else %}0{% endif %}"></span>

            {% if has_color_variant %}

                {# Item image will be the first avaiable variant #}

                {% set item_img_width = product.featured_variant_image.dimensions['width'] %}
                {% set item_img_height = product.featured_variant_image.dimensions['height'] %}
                {% set item_img_srcset = product.featured_variant_image %}
                {% set item_img_alt = product.featured_variant_image.alt %}
            {% else %}

                {# Item image will be the first image regardless the variant #}

                {% set item_img_width = product.featured_image.dimensions['width'] %}
                {% set item_img_height = product.featured_image.dimensions['height'] %}
                {% set item_img_srcset = product.featured_image %}
                {% set item_img_alt = product.featured_image.alt %}
            {% endif %}

            {% set item_img_spacing = item_img_height / item_img_width * 100 %}

            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="js-item-image-padding item-image-link p-relative" style="padding-bottom: {{ item_img_spacing }}%;" data-store="product-item-image-{{ product.id }}">
                <img alt="{{ item_img_alt }}" data-expand="-10" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ item_img_srcset | product_image_url('small')}} 240w, {{ item_img_srcset | product_image_url('medium')}} 320w, {{ item_img_srcset | product_image_url('large') }} 480w" class="js-item-image item-image lazyload img-absolute img-absolute-centered fade-in" width="{{ item_img_width }}" height="{{ item_img_height }}"/>
                <div class="js-lazy-loading-preloader item-preloader-container">
                    <div class="item-preloader placeholder-icon col-xs-7 opacity-80">
                        {% include "snipplets/svg/offer.tpl" %}
                    </div>
                </div>
                <div class="p-relative">
                    <div class="placeholder-shine">
                    </div>
                </div>
            </a>
            {% if settings.product_color_variants %}
                {% include 'snipplets/item-colors.tpl' %}
            {% endif %}
            {% if (settings.quick_view or settings.product_color_variants) and product.variations %}
                <div class="js-item-variants item-buy-variants hidden">
                    <form class="js-product-form m-bottom" method="post" action="{{ store.cart_url }}">
                        <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                        {% include "snipplets/product/variants.tpl" with {'quickshop': true} %}
                        <div class="row">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <div class="quantity quantity-no-border form-group m-bottom m-bottom-quarter-xs p-top-none-xs">
                                    <label class="quantity-label">
                                        <strong>{{ "Cantidad" | translate }}</strong>
                                    </label>
                                    <input class="quantity-input form-control col-xs-6" value="1" type="number" name="quantity" aria-label="{{ 'Cantidad' | translate }}">
                                </div>
                            </div>
                        </div>
                        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                        <input type="submit" class="js-prod-submit-form btn btn-primary js-addtocart {{state}} btn-block m-bottom" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />

                        {# Fake add to cart CTA visible during add to cart event #}
                        {% include 'snipplets/placeholders/button-placeholder.tpl' %}
                    </form>
                </div>
            {% endif %}
        </div>
        <div class="item-info-container {% if related_product %} text-left-xs {% endif %} clear-both" data-store="product-item-info-{{ product.id }}">
        <div style="display: flex; justify-content: space-between; font-size: 10px; align-items: baseline;">
            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="js-item-name item-name h5 {% if not product.display_price %}p-right-double-xs{% endif %}" aria-label="{{ product.name }}" data-store="product-item-name-{{ product.id }}">
                {% if product.name | length > 40 %}
                    {{ product.name | truncate(40) }}
                {% else %}
                    {{ product.name }}
                {% endif %}
            </a>
            <div style="display: flex; justify-content: space-between;">
                <span class="js-compare-price-display item-price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                {% if product.compare_at_price %}
                    {{ product.compare_at_price | money }}
                {% endif %}
                </span>

                <span class="js-price-display item-price d-inline-block m-top-none m-bottom-none {% if not product.display_price %} hidden{% endif %}">
                    {% if product.display_price %}
                        {{ product.price | money }}
                    {% endif %}
                </span>
            </div>


        </div>
            {# Full overlay link for mobile #}
            <a href="{{ product_url_with_selected_variant }}" class="item-mobile-link {% if settings.quick_view %}item-mobile-link-quickshop {% endif %}visible-xs" aria-label="{{ product.name }}"></a>
            {% if settings.quick_view and product.available and product.display_price %}
                <div class="item-actions m-top-half">
                    {% if product.variations %}
                        <a data-toggle="modal" data-target="#quickshop-modal" data-modal-url="modal-fullscreen-quickshop" class="js-quickshop-modal-open {% if slide_item %}js-quickshop-slide{% endif %} js-fullscreen-modal-open btn btn-primary full-width font-small-xs" title="{{ 'Compra rápida de' | translate }} {{ product.name }}" aria-label="{{ 'Compra rápida de' | translate }} {{ product.name }}" >{{ 'Agregar al carrito' | translate }}</a>
                    {% else %}
                        <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                            <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                            <input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary full-width font-small-xs {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />

                            {# Fake add to cart CTA visible during add to cart event #}
                            {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "font-small-xs"} %}

                        </form>
                    {% endif %}
                </div>
            {% endif %}
        </div>
        {% if settings.quick_view or settings.product_color_variants %}
            </div>
        {% endif %}
    </div>
    {# Structured data to provide information for Google about the product content #}
    {% include 'snipplets/structured_data/item-structured-data.tpl' %}
</div>
