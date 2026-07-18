<form action="{{ store.cart_url }}" method="post" id="ajax-cart-details" class="js-ajax-cart-panel js-fullscreen-modal ajax-cart-container modal-right modal-xs modal-xs-right modal-xs-right-out" style="display: none;" data-store="cart-form">
  <div class="modal-xs-dialog">
    {# IMPORTANT Do not remove this hidden subtotal, it is used by JS to calculate cart total #}
    <div class="subtotal-price hidden" data-priceraw="{{ cart.total }}"></div>

    {# Define contitions to show shipping calculator and store branches on cart #}

    {% set show_calculator_on_cart = settings.shipping_calculator_cart_page and store.has_shipping %}
    {% set show_cart_fulfillment = settings.shipping_calculator_cart_page and (store.has_shipping or store.branches) %}

    {# Cart panel header #}
    <div class="modal-right-header ajax-cart-header hidden-xs">
      <h4 class="ajax-cart-title m-none">{{ "Carrito de compras" | translate }}</h4>
      <a href="#" class="js-toggle-cart ajax-cart-close" aria-label="{{ 'Cerrar' | translate }}">
        {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-md svg-icon-text ajax-cart-close-icon"} %}
      </a>
    </div>
    <a class="js-toggle-cart js-fullscreen-modal-close ajax-cart-mobile-header" href="#">
      <span class="ajax-cart-mobile-back" aria-hidden="true">
        {% include "snipplets/svg/arrow-back.tpl" with {fa_custom_class: "ajax-cart-back-icon"} %}
      </span>
      <span class="ajax-cart-mobile-title">
        {{ "Carrito de compras" | translate }}
      </span>
    </a>

    <div class="modal-content">
      {# Cart panel body #}
      <div class="ajax-cart-body modal-right-body modal-xs-body">
        <div class="cart-table ajax-cart-table-wrap">
          <div class="ajax-cart-table-header cart-table-header cart-item-grid-header hidden-xs">
            <span class="cart-item-grid-header-product">{{ "Producto" | translate }}</span>
            <span class="cart-item-grid-header-qty">{{ "Cant." | translate }}</span>
            <span class="cart-item-grid-header-subtotal">{{ "Subtotal" | translate }}</span>
          </div>

          <div class="js-ajax-cart-list ajax-cart-table">

            {# Cart panel items #}
            {% if cart.items %}
              {% for item in cart.items %}
                {% include "snipplets/cart-item-ajax.tpl" %}
              {% endfor %}
            {% endif %}
          </div>

          {# Cart panel empty #}
          <div class="js-empty-ajax-cart alert alert-info m-top" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
            {{ "El carrito de compras está vacío." | translate }}
          </div>
        </div>

        {# Cart panel subtotal #}
        <div class="js-visible-on-cart-filled cart-summary-row" {% if cart.items_count == 0 %}style="display:none;"{% endif %} data-store="cart-subtotal">
            <span class="cart-summary-label text-uppercase-cart">
              {{ "Subtotal" | translate }}
              <small class="js-subtotal-shipping-wording" {% if not (cart.has_shippable_products or show_calculator_on_cart) %}style="display: none"{% endif %}>{{ " (sin envío)" | translate }}</small>
            </span>
            <span class="js-ajax-cart-total js-cart-subtotal cart-summary-value weight-strong" data-priceraw="{{ cart.subtotal }}">{{ cart.subtotal | money }}</span>
        </div>

        {# Cart panel promos #}
        <div class="js-total-promotions total-promotions ajax-cart-promotions">
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
              <div class="js-total-promotions-detail-row total-promotions-row cart-summary-row text-uppercase-cart" id="{{ id }}">
                <span class="cart-promotion-detail cart-summary-label">
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

        {# Shipping calculator and branch link #}

        {% if show_cart_fulfillment %}
          <div class="js-fulfillment-info js-allows-non-shippable" {% if not cart.has_shippable_products %}style="display: none"{% endif %}>

            <div class="js-visible-on-cart-filled js-has-new-shipping js-shipping-calculator-container">

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

              <div id="cart-shipping-container" class="ajax-cart-shipping {% if store.branches %}m-bottom{% else %}m-bottom-double{% endif %}" {% if cart.items_count == 0 %} style="display: none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

                {# Used to save shipping #}

                <span id="cart-selected-shipping-method" data-code="{{ cart.shipping_data.code }}" class="hide">{{ cart.shipping_data.name }}</span>

                {# Shipping Calculator #}

                {% if store.has_shipping %}
                  {% include "snipplets/shipping/shipping_cost_calculator.tpl" with {'product_detail': false} %}
                {% endif %}

                {# Store branches #}

                {% if store.branches %}

                  {# Link for branches #}

                  {% include "snipplets/shipping/branch-details.tpl" with {'product_detail': false} %}
                {% endif %}
              </div>
            </div>
          </div>
        {% endif %}

        {# Cart panel total #}
        <div class="js-cart-total-container ajax-cart-total-container cart-total js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %} data-store="cart-total">
          <div class="cart-summary-row cart-summary-total">
            <span class="cart-summary-label text-uppercase-cart">{{ "Total" | translate }}</span>
            <span class="js-cart-total cart-summary-value {% if cart.free_shipping.cart_has_free_shipping %}js-free-shipping-achieved{% endif %} {% if cart.shipping_data.selected %}js-cart-saved-shipping{% endif %}">{{ cart.total | money }}</span>
          </div>
          {# IMPORTANT Do not remove this hidden total, it is used by JS to calculate cart total #}
          <div class='total-price hidden'>
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
          <div {% if installment < 2 or ( store.country == 'AR' and interest == true ) %} style="display: none;" {% endif %} data-interest="{{ interest_value }}" data-cart-installment="{{ installment }}" class="js-installments-cart-total font-small cart-installments">
              {{ 'O hasta' | translate }}
              {% if interest == true %}
                {{ "<span class='js-cart-installments-amount'>{1}</span> cuotas de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
              {% else %}
                {{ "<span class='js-cart-installments-amount'>{1}</span> cuotas sin interés de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
              {% endif %}
          </div>
        </div>
        <div class="ajax-cart-bottom js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
          <div id="error-ajax-stock" class='alert alert-warning m-top' style="display:none;">
              {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}
              <a href="{{ store.products_url }}" class="btn btn-link p-none">{{ "ver otros acá" | translate }}</a>
          </div>

          {# Cart panel CTA #}
          {% set cart_total = (settings.cart_minimum_value * 100) %}
          <div class="js-ajax-cart-submit" {{ not cart.checkout_enabled ? 'style="display:none"' }} id="ajax-cart-submit-div">
            <input class="btn btn-primary btn-block ajax-cart-checkout-btn" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}"/>
          </div>

          {# Cart panel continue buying link #}
          {% if settings.continue_buying %}
            <a href="#" class="js-toggle-cart js-fullscreen-modal-close btn btn-link btn-block ajax-cart-continue">{{ 'Ver más productos' | translate }}</a>
          {% endif %}

          <div class="js-ajax-cart-minimum" {{ cart.checkout_enabled ? 'style="display:none"' }} id="ajax-cart-minumum-div">
            <div class="alert alert-warning" role="alert">
              <h5 class="text-center">{{ "El monto mínimo de compra es de {1} sin incluir el costo de envío" | t(cart_total | money) }}</h5>
            </div>
          </div>
          <input type="hidden" id="ajax-cart-minimum-value" value="{{ cart_total }}"/>
        </div>
      </div>
    </div>
  </div>
</form>

<div id="ajax-cart-backdrop" class="js-toggle-cart js-ajax-backdrop backdrop hidden-xs" style="display: none;"></div>
