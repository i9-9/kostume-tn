<div class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} cart-table-row ajax-cart-item row" data-item-id="{{ item.id }}" data-store="cart-item-{{ item.product.id }}">

  {% set show_free_shipping_label = item.product.free_shipping and not (cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price) %}

  {# Cart item image #}
  <div class="col-xs-2 ajax-cart-item-image-col p-right-none p-left-half-xs">
    <img src="{{ item.featured_image | product_image_url('medium') }}" class="img-responsive" />
  </div>
  <div class="col-xs-10 col-sm-5 col-md-5 col-lg-5 p-right-half-xs">

    {# Cart item name #}
    <div class="ajax-cart-item-link cart-item-name">
      <a class=" text-underline h5-xs" href="{{ item.url }}">
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

    {# Cart item unit price #}
    <div class="ajax-cart-item-unit-price hidden-xs">
      {{ item.unit_price | money }}
    </div>

    {# Cart item quantity controls #}
    <div class="pull-left m-top-quarter">
      <button type="button" class="js-cart-quantity-btn cart-quantity-btn btn btn-default" onclick="LS.minusQuantity({{ item.id }}, true)" style="border-radius: 0;">
        <div class="cart-quantity-svg-icon">
          {% include "snipplets/svg/minus.tpl" %}
        </div>
      </button>
      <div class="cart-quantity-input-container d-inline-block pull-left">
        {# Always place this spinner before the quantity input #}

        <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
          {% include "snipplets/svg/spinner.tpl" with {fa_custom_class: "fa-sm fa-spin svg-text-fill"} %}
        </span>
        <input type="number" name="quantity[{{ item.id }}]" data-item-id="{{ item.id }}" value="{{ item.quantity }}" class="js-cart-quantity-input cart-quantity-input"/>
      </div>
      <button type="button" class="js-cart-quantity-btn cart-quantity-btn btn btn-default" onclick="LS.plusQuantity({{ item.id }}, true)" style="border-radius: 0;">
        <div class="cart-quantity-svg-icon">
          {% include "snipplets/svg/plus.tpl" %}
        </div>
      </button>
    </div>

    {# Cart item subtotal mobile #}
    <div class="visible-xs cart-item-subtotal h5-xs weight-strong pull-right">
      <span class="js-cart-item-subtotal" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
    </div>
  </div>

  {# Cart item subtotal #}
  <div class="col-xs-4 ajax-cart-item-subtotal cart-item-subtotal h6-xs weight-strong text-right hidden-xs">
    <span class="js-cart-item-subtotal" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
  </div>

  {# Cart item delete #}
  <div class="col-xs-1 cart-delete-container text-right">
    <button type="button" class="cart-btn-delete ajax-cart-btn-delete pull-right p-top-none p-right-none" onclick="LS.removeItem({{ item.id }}, true)">
      <div class="cart-delete-svg-icon svg-icon-text">
        {% include "snipplets/svg/trash.tpl" %}
      </div>
    </button>
  </div>
</div>