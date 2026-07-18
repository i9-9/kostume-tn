<form action="" method="post" class="m-bottom visible-when-content-ready cart-page-form" data-store="cart-form">
    <span class="js-has-new-shipping" data-priceraw="{{ cart.subtotal }}"></span>

    {# Define contitions to show shipping calculator and store branches on cart #}

    {% set show_calculator_on_cart = settings.shipping_calculator_cart_page and store.has_shipping %}
    {% set show_cart_fulfillment = settings.shipping_calculator_cart_page and (store.has_shipping or store.branches) %}

	<div class="cart-contents js-cart-contents">
        <div class="cart-table cart-page-table">
            <div class="cart-table-header cart-item-grid-header cart-item-grid-header-page hidden-xs">
    			<span class="cart-item-grid-header-product">{{ "Producto" | translate }}</span>
    			<span class="cart-item-grid-header-qty">{{ "Cantidad" | translate }}</span>
    			<span class="cart-item-grid-header-price">{{ "Precio" | translate }}</span>
    			<span class="cart-item-grid-header-subtotal">{{ "Subtotal" | translate }}</span>
    		</div>

            {# Cart items #}
    		{% for item in cart.items %}

                {% set show_free_shipping_label = item.product.free_shipping and not (cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price) %}

                {# productrow class is nedded to show the AJAX JS errors #}

    			<div class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} cart-table-row cart-item-grid cart-item-grid-page" data-item-id="{{ item.id }}" data-store="cart-item-{{ item.product.id }}">

                    <a href="{{ item.url }}" class="cart-item-grid-thumb">
                        {{ item.featured_image | product_image_url("medium") | img_tag(item.featured_image.alt, {class: 'img-responsive'}) }}
                    </a>

                    <div class="cart-item-grid-info">
                        <div class="cart-item-name">
                            <a class="name" href="{{ item.url }}">
                                {{ item.short_name }}
                                {% if item.short_variant_name %}
                                    <small>{{ item.short_variant_name }}</small>
                                {% endif %}
                            </a>
                            {% if show_free_shipping_label %}
                                <div class="cart-item-free-label">
                                  <span class="product-label product-label-shipping product-label-small m-none">
                                    <span class="product-label-icon p-none">
                                      {% include "snipplets/svg/truck.tpl" %}
                                    </span>
                                    <span class="product-label-text">
                                      {{ "Gratis" | translate }}
                                    </span>
                                  </span>
                                </div>
                            {% endif %}
                        </div>
                        <div class="cart-item-unit-price visible-xs">
                            {{ item.unit_price | money }}
                        </div>
                    </div>

                    <div class="cart-item-grid-qty cart-quantity-controls">
                        <button type="button" class="js-cart-quantity-btn cart-quantity-btn btn btn-default" onclick="LS.minusQuantity({{ item.id }})">
                            <div class="cart-quantity-svg-icon">
                                {% include "snipplets/svg/minus.tpl" %}
                            </div>
                        </button>
                        <div class="cart-quantity-input-container">
                            {# Always place this spinner before the quantity input #}
                            <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
                              {% include "snipplets/svg/spinner.tpl" with {fa_custom_class: "fa-sm fa-spin svg-text-fill"} %}
                            </span>
                            <input type="number" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();" class="js-cart-quantity-input cart-quantity-input" />
                        </div>
                        <button type="button" class="js-cart-quantity-btn cart-quantity-btn btn btn-default" onclick="LS.plusQuantity({{ item.id }})">
                            <div class="cart-quantity-svg-icon">
                                {% include "snipplets/svg/plus.tpl" %}
                            </div>
                        </button>
                    </div>

                    <div class="cart-item-grid-price cart-item-unit-price hidden-xs">
                        {{ item.unit_price | money }}
                    </div>

                    <div class="cart-item-grid-subtotal cart-item-subtotal weight-strong">
                        <span class="js-cart-item-subtotal" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
                    </div>

                    <div class="cart-item-grid-delete cart-delete-container">
                        <button type="button" class="item-delete cart-btn-delete" onclick="LS.removeItem({{ item.id }})" aria-label="{{ 'Eliminar' | translate }}">
                            <div class="cart-delete-svg-icon svg-icon-text">
                                {% include "snipplets/svg/trash.tpl" %}
                            </div>
                        </button>
                    </div>
    			</div>
            {% endfor %}
        </div>

        <div class="totals-container cart-page-totals">
            <div class="cart-page-fulfillment">

                {# Cart shipping #}

                {% if show_cart_fulfillment %}
                    <div class="js-shipping-calculator-container">

                        <div class="js-fulfillment-info js-allows-non-shippable" {% if not cart.has_shippable_products %}style="display: none"{% endif %}>

                            {# Saved shipping not available #}

                            <div class="js-shipping-method-unavailable alert alert-warning m-top-half" style="display: none;">
                                <div>
                                    <strong>{{ 'El medio de envío que habías elegido ya no se encuentra disponible para este carrito. ' | translate }}</strong>
                                </div>
                                <div>
                                    {{ '¡No te preocupes! Podés elegir otro.' | translate}}
                                </div>
                            </div>

                            {# Shipping calculator and branch link #}

                            <div id="cart-shipping-container" class="cart-page-shipping {% if store.branches %}m-bottom{% else %}m-bottom-double{% endif %}" {% if cart.items_count == 0 %} style="display: none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

                                {# Used to save shipping #}

                                <span id="cart-selected-shipping-method" data-code="{{ cart.shipping_data.code }}" class="hide">{{ cart.shipping_data.name }}</span>

                                {# Shipping Calculator #}

                                {% if store.has_shipping %}
                                  {% include "snipplets/shipping/shipping_cost_calculator.tpl" with { 'product_detail': false} %}
                                {% endif %}

                                {# Store branches #}

                                {% if store.branches %}

                                    {# Link for branches #}

                                    {% include "snipplets/shipping/branch-details.tpl" with {'product_detail': false} %}
                                {% endif %}
                            </div>
                        </div>
                    </div>
                {% endif%}
                {% if cart.items and settings.continue_buying %}
                    <div class="hidden-xs cart-continue-desktop">
                        {% snipplet "cart/continue-buying.tpl" %}
                    </div>
                {% endif %}
            </div>

            <div class="cart-page-summary">
                <div class="cart-subtotal cart-summary-row subtotal-information" data-store="cart-subtotal">
                    <span class="cart-summary-label text-uppercase-cart">
                        {{ "Subtotal" | translate }}
                        <small class="js-subtotal-shipping-wording" {% if not (cart.has_shippable_products or show_calculator_on_cart) %}style="display: none"{% endif %}>{{ " (sin envío)" | translate }}</small>
                    </span>
                    <span class="js-cart-subtotal cart-summary-value weight-strong" data-priceraw="{{ cart.subtotal }}">{{ cart.subtotal | money }}</span>
                </div>

                {# Cart promos #}
                <div class="js-total-promotions total-promotions">
                    <span class="js-promo-in" style="display:none;">{{ "en" | translate }}</span>
                    <span class="js-promo-all" style="display:none;">{{ "todos los productos" | translate }}</span>
                    <span class="js-promo-buying" style="display:none;"> {{ "comprando" | translate }}</span>
                    <span class="js-promo-units-or-more" style="display:none;"> {{ "o más." | translate }}</span>
                    {% for promotion in cart.promotional_discount.promotions_applied %}
                        {% if(promotion.scope_value_id) %}
                            {% set id = promotion.scope_value_id %}
                        {% else %}
                            {% set id = 'all' %}
                        {% endif %}
                        <div class="js-total-promotions-detail-row total-promotions-row cart-summary-row" id="{{ id }}">
                            <span class="cart-summary-label">
                             {% if promotion.discount_script_type != "custom" %}
                                {% if promotion.discount_script_type == "NAtX%off" %}
                                    {{ promotion.selected_threshold.discount_decimal_percentage * 100 }}% OFF
                                {% else %}
                                    {{ promotion.discount_script_type }}
                                {% endif %}
                                {{ "en" | translate }} {% if id == 'all' %}{{ "todos los productos" | translate }}{% else %}{{ promotion.scope_value_name }}{% endif %}

                                {% if promotion.discount_script_type == "NAtX%off" %}
                                    <span class="text-lowercase">{{ "Comprando {1} o más." | translate(promotion.selected_threshold.quantity) }}</span>
                                {% endif %}
                            {% else %}
                                {{ promotion.scope_value_name }}
                            {% endif %}
                            </span>
                            <span class="cart-promotion-number weight-strong text-primary cart-summary-value">-{{ promotion.total_discount_amount_short }}</span>
                        </div>
                    {% endfor %}
                </div>

                {# Cart totals #}
                <div class="cart-total" data-store="cart-total">
                    <div class="cart-summary-row cart-summary-total">
                        <span class="cart-summary-label text-uppercase-cart">{{ "Total" | translate }}</span>
                        <span class="js-cart-total cart-summary-value {% if cart.free_shipping.cart_has_free_shipping %}js-free-shipping-achieved{% endif %} {% if cart.shipping_data.selected %}js-cart-saved-shipping{% endif %}" data-priceraw="{{ cart.total }}">{{ cart.total | money }}</span>
                    </div>

                    {# IMPORTANT Do not remove this hidden total, it is used by JS to calculate cart total #}
                    <div class='total-price hidden' data-priceraw="{{ cart.total }}">
                        {{ "Total" | translate }}: {{ cart.total | money }}
                    </div>

                    {# Cart installments #}

                    {% if cart.installments.max_installments_without_interest > 1 %}
                        {% set installment =  cart.installments.max_installments_without_interest  %}
                        {% set total_installment = cart.total %}
                        {% set interest = false %}
                        {% set interest_value = 0 %}
                    {% else %}
                        {% set installment = cart.installments.max_installments_with_interest  %}
                        {% set total_installment = (cart.total * (1 + cart.installments.interest)) %}
                        {% set interest = true %}
                        {% set interest_value = cart.installments.interest %}
                    {% endif %}
                    <div {% if installment < 2 or ( store.country == 'AR' and interest == true ) %} style="display: none;" {% endif %} data-interest="{{ interest_value }}" data-cart-installment="{{ installment }}" class="js-installments-cart-total font-body cart-installments">
                        {{ 'O hasta' | translate }}
                        {% if interest == true %}
                          {{ "<span class='js-cart-installments-amount'>3 y 6</span> cuotas de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
                        {% else %}
                          {{ "<span class='js-cart-installments-amount'>3 y 6</span> cuotas sin interés de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
                        {% endif %}
                    </div>

                </div>

                {# Cart CTA #}
                <div class="cart-page-cta">
                    {% set cart_total = (settings.cart_minimum_value * 100) %}
                    {% if cart.checkout_enabled %}
                        <input id="go-to-checkout" class="js-go-checkout-btn btn btn-primary btn-block ajax-cart-checkout-btn" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" autocomplete="off">
                    {% else %}
                        <h4 class="text-center">{{ "El monto mínimo de compra es de {1} sin incluir el costo de envío" | t(cart_total | money) }}</h4>
                    {% endif %}
                </div>
                {% if cart.items and settings.continue_buying %}
                    <div class="visible-xs cart-continue-mobile">
                        {% snipplet "cart/continue-buying.tpl" %}
                    </div>
                {% endif %}
            </div>
        </div>
	</div>

    {# Cart alerts #}
	<div id="error-ajax-stock" class='alert alert-warning m-top' style="display:none;">
        {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}
        <a href="{{ store.products_url }}" class="btn btn-link p-none">{{ "ver otros acá" | translate }}</a>
    </div>
</form>
