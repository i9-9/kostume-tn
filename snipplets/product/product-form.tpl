<form class="js-product-form {% if settings.show_description_bottom %}col-xs-12 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 {% else %} full-width {% endif %} display-when-content-ready" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
    <input type="hidden" name="add_to_cart" value="{{product.id}}">
    {# Product Variants #}
    {% if product.variations %}
        {% include "snipplets/product/variants.tpl" with {'quickshop': false} %}
    {% endif %}
    {% if product.available and product.display_price %}
        <div class="row product-quantity {% if product.show_installments and not product.variations %} border-none-xs p-top-none-xs {% endif %}">
            <div class="col-xs-12 {% if settings.show_description_bottom %}col-sm-4 col-sm-offset-4 col-md-2 col-md-offset-5 col-lg-2 col-lg-offset-5 {% else %}col-sm-4 col-md-3 col-lg-3{% endif %}">
                <div class="quantity form-group">
                    <input class="js-product-quantity js-quantity-input quantity-input form-control col-xs-6" value="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}" aria-label="{{ "Cantidad" | translate }}" style="padding: 0; border-bottom: 2px solid #fff;">
                    <label class="quantity-label" style="text-transform: uppercase; margin-top: 10px;">
                        {{ "Cantidad" | translate }}
                    </label>

                </div>
            </div>
        </div>
    {% endif %}  

    {# Product Add to Cart button #}
    <div class="row m-top">
        <div class="add-to-cart col-xs-12 col-sm-12 {% if settings.show_description_bottom %} col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2 {% else %} col-md-12 col-lg-12 {% endif %} m-bottom">
             {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

            {# Add to cart CTA #}
            
            <input type="submit" class="js-prod-submit-form btn btn-primary js-addtocart {{state}} btn-block" value="{{ texts[state] | translate }}" aria-label="{{ texts[state] | translate }}"  {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" style="border-radius: 0;">

            {# Fake add to cart CTA visible during add to cart event #}
            {% include 'snipplets/placeholders/button-placeholder.tpl' %}

            {% if settings.ajax_cart %}
                <div class="js-added-to-cart-product-message pull-left full-width m-bottom-half m-top-quarter" style="display: none;">
                    {% include "snipplets/svg/check-circle.tpl" with {fa_custom_class: "fa-md svg-icon-primary m-right-quarter"} %}
                    <span class="icon-align-middle d-inline-block">
                        {{'Ya agregaste este producto.' | translate }}
                        <a href="#" class="js-toggle-cart js-fullscreen-modal-open btn btn-link p-left-quarter" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                    </span>
                </div>
            {% endif %}
        </div>
    </div>
</form>

{# Define contitions to show shipping calculator and store branches on product page #}

{% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

{% if show_product_fulfillment %}

    <div class="{% if not settings.show_description_bottom %}row{% endif %} m-bottom display-when-content-ready">
        {# Shipping calculator and branch link #}

        <div class="col-xs-12 col-sm-12 {% if settings.show_description_bottom %} col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 {% endif %}">
            <div id="product-shipping-container" class="m-bottom m-top-half" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

                {# Shipping Calculator #}

                {% if store.has_shipping %}
                    {% include "snipplets/shipping/shipping_cost_calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
                {% endif %}

                {# Store branches #}
                                    
                {% if store.branches %}
                    {# Link for branches modal #}
                    {% include "snipplets/shipping/branch-details.tpl" with {'product_detail': true} %}
                {% endif %}
            </div>
        </div>
    </div>

{% endif %}
