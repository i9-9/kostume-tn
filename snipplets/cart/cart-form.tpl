<form action="" method="post" class="m-bottom visible-when-content-ready" data-store="cart-form">
    <span class="js-has-new-shipping" data-priceraw="{{ cart.subtotal }}"></span>

    {# Define contitions to show shipping calculator and store branches on cart #}

    {% set show_calculator_on_cart = settings.shipping_calculator_cart_page and store.has_shipping %}
    {% set show_cart_fulfillment = settings.shipping_calculator_cart_page and (store.has_shipping or store.branches) %}

	<div class="cart-contents js-cart-contents">
        <div class="cart-table container-fluid">
            <ul class="cart-table-header row hidden-xs">
    			<li class="col-product col-xs-4 col-sm-4 col-md-4 col-lg-4">{{ "Producto" | translate }}</li>
    			<li class="col-quantity col-xs-3 col-sm-5 col-md-3 col-lg-3">{{ "Cantidad" | translate }}</li>
    			<li class="col-price col-xs-2 col-sm-2 col-md-2 col-lg-2 hidden-sm hidden-xs">{{ "Precio" | translate }}</li>
    			<li class="col-subtotal col-xs-2 col-sm-2 col-md-2 col-lg-2">{{ "Subtotal" | translate }}</li>
    		</ul>

            {# Cart items #}
    		{% for item in cart.items %}

                {% set show_free_shipping_label = item.product.free_shipping and not (cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price) %}

                {# productrow class is nedded to show the AJAX JS errors #}

    			<ul class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} cart-table-row row" data-item-id="{{ item.id }}" data-store="cart-item-{{ item.product.id }}">

                    <li class="cart-table-product col-xs-3 col-sm-4 col-md-4 col-lg-4 p-right-none-xs p-left-half-xs">
                        <div class="row">

                            {# Cart item image #}
                            <a href="{{ item.url }}" class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                {{ item.featured_image | product_image_url("medium") | img_tag(item.featured_image.alt, {class: 'img-responsive'}) }}
                            </a>

                            {# Cart item name #}
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 hidden-xs">
                                <a class="name" href="{{ item.url }}">{{ item.name }}<small>{{ item.short_variant_name }}</small></a>
                                {% if show_free_shipping_label %}
                                    <div class="m-bottom-quarter m-top-half-xs m-top-quarter">
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
                        </div>
                    </li>
                    <li class="cart-quantity col-xs-9 col-sm-3 col-md-3 col-lg-3 p-right-half-xs">

                        {# Cart item mobile name #}
                        <div class="cart-item-name  visible-xs">
                            <a class="name text-underline h5" href="{{ item.url }}">
                                {{ item.short_name }}
                                <small>{{ item.short_variant_name }}</small>
                            </a>
                            
                            {% if show_free_shipping_label %}
                                <div class="m-bottom-quarter m-top-half-xs m-top-quarter">
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

                        {# Cart quantity controls #}
                        <button type="button" class="js-cart-quantity-btn cart-quantity-btn btn btn-default" onclick="LS.minusQuantity({{ item.id }})" style="border-radius: 0;">
                            <div class="cart-quantity-svg-icon">
                                {% include "snipplets/svg/minus.tpl" %}
                            </div>
                        </button>
                        <div class="cart-quantity-input-container d-inline-block pull-left">
                            {# Always place this spinner before the quantity input #}

                            <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
                              {% include "snipplets/svg/spinner.tpl" with {fa_custom_class: "fa-sm fa-spin svg-text-fill"} %}
                            </span>
                            <input type="number" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();" class="js-cart-quantity-input cart-quantity-input" />
                        </div>
                        <button type="button" class="js-cart-quantity-btn cart-quantity-btn btn btn-default" onclick="LS.plusQuantity({{ item.id }})" style="border-radius: 0;>
                            <div class="cart-quantity-svg-icon">
                                {% include "snipplets/svg/plus.tpl" %}
                            </div>
                        </button>

                        {# Cart item mobile subtotal #}
                        <div class="visible-xs cart-item-subtotal pull-right h5">
                            <span class="js-cart-item-subtotal" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
                        </div>
                    </li>

                    {# Cart item unit price #}
                    <li class="col-price col-sm-2 col-md-2 col-lg-2 hidden-xs h4 m-none">
                        {{ item.unit_price | money }}
                    </li>

                    {# Cart item subtotal #}
                     <li class="col-sm-2 col-md-2 col-lg-2 hidden-xs h4 m-none">
                        <span class="js-cart-item-subtotal" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
                    </li>

                    {# Cart item delete #}
                    <li class="cart-delete-container col-xs-1 col-sm-1 col-md-1 col-lg-1 text-right">
                        <button type="button" class="item-delete cart-btn-delete p-top-none pull-right-xs" onclick="LS.removeItem({{ item.id }})">
                            <div class="cart-delete-svg-icon svg-icon-text">
                                {% include "snipplets/svg/trash.tpl" %}
                            </div>
                        </button>
                    </li>
    			</ul>
            {% endfor %}
        </div>

        <div class="totals-container row">
            <div class="col-xs-12 col-sm-6">
                <div class="row visible-xs">

                    {# Cart subtotal mobile #}
                    <div class="cart-subtotal h4 subtotal-information m-bottom-half col-xs-12" data-store="cart-subtotal">
                        <span class="pull-left text-left text-uppercase-cart">
                            {{ "Subtotal" | translate }} 
                            <small class="js-subtotal-shipping-wording" {% if not (cart.has_shippable_products or show_calculator_on_cart) %}style="display: none"{% endif %}>{{ " (sin envío)" | translate }}</small>
                            :
                        </span>
                        <span class="js-cart-subtotal pull-right text-right weight-strong m-left-quarter" data-priceraw="{{ cart.subtotal }}">{{ cart.subtotal | money }}</span>
                    </div>

                    {# Cart promos mobile #}
                    <div class="js-total-promotions total-promotions h5 clear-both m-bottom-half m-top-none visible-xs col-xs-12">
                        {% for promotion in cart.promotional_discount.promotions_applied %}
                            {% if(promotion.scope_value_id) %}
                                {% set id = promotion.scope_value_id %}
                            {% else %}
                                {% set id = 'all' %}
                            {% endif %}
                            <span class="js-total-promotions-detail-row total-promotions-row pull-left" id="{{ id }}">
                                <span class="pull-left cart-promotion-detail">
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
                                    :
                                </span>
                                <span class="cart-promotion-number weight-strong text-primary pull-right">-{{ promotion.total_discount_amount_short }}</span>
                            </span>
                        {% endfor %}
                    </div>
                </div>


                {# Cart shipping #}
                
                {% if show_cart_fulfillment %}
                    <div class="row">
                        <div class="col-xs-12 col-sm-9 js-shipping-calculator-container">

                            <div class="js-fulfillment-info js-allows-non-shippable" {% if not cart.has_shippable_products %}style="display: none"{% endif %}>
                            
                                {# Shipping calculator and branch link #}
                                
                                {# Saved shipping not available #}

                                <div class="js-shipping-method-unavailable alert alert-warning clear-both m-top-half pull-left" style="display: none;">
                                    <div>
                                        <strong>{{ 'El medio de envío que habías elegido ya no se encuentra disponible para este carrito. ' | translate }}</strong>
                                    </div>
                                    <div>
                                        {{ '¡No te preocupes! Podés elegir otro.' | translate}}
                                    </div>
                                </div>

                                {# Shipping calculator and branch link #}

                                <div id="cart-shipping-container" class="full-width-container m-top-half {% if store.branches %}m-bottom{% else %}m-bottom-double{% endif %}" {% if cart.items_count == 0 %} style="display: none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

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
                    </div>
                {% endif%}
                {% if cart.items and settings.continue_buying %}
                    <div class="hidden-xs">
                        {% snipplet "cart/continue-buying.tpl" %}
                    </div>
                {% endif %}
            </div>
            <div class="col-xs-12 col-sm-6 text-right">
                <div class="cart-subtotal h4 subtotal-information m-top m-bottom-none hidden-xs" data-store="cart-subtotal">

                    {# Cart subtotal #}
                    <span class="pull-left text-left text-uppercase-cart">
                        {{ "Subtotal" | translate }} 
                        <small class="js-subtotal-shipping-wording" {% if not (cart.has_shippable_products or show_calculator_on_cart) %}style="display: none"{% endif %}>{{ " (sin envío)" | translate }}</small>
                        :
                    </span>
                    <span class="js-cart-subtotal pull-right text-right weight-strong m-left-quarter" data-priceraw="{{ cart.subtotal }}">{{ cart.subtotal | money }}</span>
                </div>

                {# Cart promos #}
                <div class="js-total-promotions total-promotions h5 clear-both pull-right hidden-xs">
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
                        <span class="js-total-promotions-detail-row total-promotions-row p-bottom-quarter" id="{{ id }}">
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
                            : 
                            <span class="cart-promotion-number weight-strong text-primary m-left-quarter">-{{ promotion.total_discount_amount_short }}</span>
                        </span>
                    {% endfor %}
                </div>

                {# Cart totals #}
                <div class="cart-total h2 m-top-half-xs m-bottom-xs" data-store="cart-total">
                    <span class="pull-left-xs">{{ "Total" | translate }}:</span>
                    <span class="js-cart-total {% if cart.free_shipping.cart_has_free_shipping %}js-free-shipping-achieved{% endif %} {% if cart.shipping_data.selected %}js-cart-saved-shipping{% endif %}" data-priceraw="{{ cart.total }}">{{ cart.total | money }}</span>
                    
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
                    <div {% if installment < 2 or ( store.country == 'AR' and interest == true ) %} style="display: none;" {% endif %} data-interest="{{ interest_value }}" data-cart-installment="{{ installment }}" class="js-installments-cart-total font-body clear-both text-right p-top-quarter">    
                        {{ 'O hasta' | translate }}
                        {% if interest == true %}
                          {{ "<span class='js-cart-installments-amount'>3 y 6</span> cuotas de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
                        {% else %}
                          {{ "<span class='js-cart-installments-amount'>3 y 6</span> cuotas sin interés de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
                        {% endif %}
                    </div>

                </div>

                {# Cart CTA #}
                <div class="m-top"> 
                    {% set cart_total = (settings.cart_minimum_value * 100) %}
                    {% if cart.checkout_enabled %}
                        <input id="go-to-checkout" class="js-go-checkout-btn btn btn-primary col-xs-12 col-sm-6 col-md-6 col-lg-6 pull-right" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" autocomplete="off" style="border-radius: 0;">
                    {% else %}
                        <h4 class="text-center-xs">{{ "El monto mínimo de compra es de {1} sin incluir el costo de envío" | t(cart_total | money) }}</h4>
                    {% endif %}
                </div>
                {% if cart.items and settings.continue_buying %}
                    <div class="visible-xs">
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
