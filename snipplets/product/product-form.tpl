<form class="js-product-form {% if settings.show_description_bottom %}col-xs-12 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 {% else %} full-width {% endif %} display-when-content-ready" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
    <input type="hidden" name="add_to_cart" value="{{product.id}}">

    {% set show_product_quantity = product.available and product.display_price %}

    <div class="product-size-qty-row{% if show_product_quantity %} has-quantity{% endif %}">
        {# Product Variants #}
        {% if product.variations %}
            {% include "snipplets/product/variants.tpl" with {'quickshop': false} %}
        {% endif %}

        {% if show_product_quantity %}
            <div class="product-quantity product-quantity-inline {% if product.show_installments and not product.variations %} border-none-xs p-top-none-xs {% endif %}">
                <div class="quantity form-group">
                    <label class="quantity-label" for="product-quantity-input">
                        {{ "Cantidad" | translate }}
                    </label>
                    <input id="product-quantity-input" class="js-product-quantity js-quantity-input quantity-input form-control" value="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}" aria-label="{{ "Cantidad" | translate }}">
                </div>
            </div>
        {% endif %}
    </div>

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
                <div class="js-added-to-cart-product-message added-to-cart-message pull-left full-width m-bottom-half m-top-quarter" style="display: none;">
                    {% include "snipplets/svg/check-circle.tpl" with {fa_custom_class: "fa-md svg-icon-primary m-right-quarter"} %}
                    <span class="icon-align-middle d-inline-block">
                        {{'Ya agregaste este producto.' | translate }}
                        <a href="#" class="js-toggle-cart js-fullscreen-modal-open btn btn-link p-left-quarter" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                    </span>
                </div>
            {% endif %}
        </div>
    </div>

    {# Medios de pago: debajo de Agregar al carrito #}
    {% if product.show_installments and product.display_price %}
        {% set installments_info = product.installments_info_from_any_variant %}
        {% if installments_info %}
            <div class="product-payments-link display-when-content-ready" {% if (not product.get_max_installments) and (not product.get_max_installments(false)) %}style="display:none;margin:8px 0 32px;"{% else %}style="margin:8px 0 32px;"{% endif %}>
                {% if custom_payment.discount > 0 %}
                    <div class="m-bottom-quarter">
                        <span class="text-tertiary product-payments-link-text"><strong>{{ custom_payment.discount }}% {{'de descuento' | translate }}</strong> {{'pagando con' | translate }} {{ custom_payment.name }}</span>
                    </div>
                {% endif %}
                <a href="#installments-modal" data-toggle="modal" data-modal-url="modal-fullscreen-payments" class="js-fullscreen-modal-open js-product-payments-container js-refresh-installment-data product-payments-link-anchor">
                    <span id="btn-installments" class="btn-link">
                        {% set store_set_for_new_installments_view = store.is_set_for_new_installments_view %}
                        {% if store_set_for_new_installments_view %}
                            {{ "Ver medios de pago" | translate }}
                        {% else %}
                            {{ "Ver el detalle de las cuotas" | translate }}
                        {% endif %}
                    </span>
                </a>
            </div>
        {% endif %}
    {% endif %}
</form>

{# Define contitions to show shipping calculator and store branches on product page #}

{% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

{% if show_product_fulfillment %}

            <div class="{% if not settings.show_description_bottom %}row{% endif %} display-when-content-ready" style="margin:0 0 8px;">
        {# Shipping calculator and branch link #}

        <div class="col-xs-12{% if settings.show_description_bottom %} col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4{% endif %}">
            <div id="product-shipping-container" style="{% if not product.display_price or not product.has_stock %}display:none;{% endif %}margin:0;" data-shipping-url="{{ store.shipping_calculator_url }}">

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
