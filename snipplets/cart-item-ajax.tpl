{% set show_free_shipping_label = item.product.free_shipping and not (cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price) %}

<div class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} cart-table-row ajax-cart-item cart-item-grid" data-item-id="{{ item.id }}" data-store="cart-item-{{ item.product.id }}">

  {# Cart item image #}
  <a href="{{ item.url }}" class="cart-item-grid-thumb">
    <img src="{{ item.featured_image | product_image_url('medium') }}" class="img-responsive" alt="{{ item.short_name }}" />
  </a>

  {# Cart item info #}
  <div class="cart-item-grid-info">
    <div class="ajax-cart-item-link cart-item-name">
      <a href="{{ item.url }}">
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
    <div class="ajax-cart-item-unit-price cart-item-unit-price">
      {{ item.unit_price | money }}
    </div>
  </div>

  {# Cart item quantity controls #}
  <div class="cart-item-grid-qty cart-quantity-controls">
    <button type="button" class="js-cart-quantity-btn cart-quantity-btn btn btn-default" onclick="LS.minusQuantity({{ item.id }}, true)">
      <div class="cart-quantity-svg-icon">
        {% include "snipplets/svg/minus.tpl" %}
      </div>
    </button>
    <div class="cart-quantity-input-container">
      {# Always place this spinner before the quantity input #}
      <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
        {% include "snipplets/svg/spinner.tpl" with {fa_custom_class: "fa-sm fa-spin svg-text-fill"} %}
      </span>
      <input type="number" name="quantity[{{ item.id }}]" data-item-id="{{ item.id }}" value="{{ item.quantity }}" class="js-cart-quantity-input cart-quantity-input"/>
    </div>
    <button type="button" class="js-cart-quantity-btn cart-quantity-btn btn btn-default" onclick="LS.plusQuantity({{ item.id }}, true)">
      <div class="cart-quantity-svg-icon">
        {% include "snipplets/svg/plus.tpl" %}
      </div>
    </button>
  </div>

  {# Cart item subtotal #}
  <div class="cart-item-grid-subtotal cart-item-subtotal weight-strong">
    <span class="js-cart-item-subtotal" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
  </div>

  {# Cart item delete #}
  <div class="cart-item-grid-delete cart-delete-container">
    <button type="button" class="cart-btn-delete ajax-cart-btn-delete" onclick="LS.removeItem({{ item.id }}, true)" aria-label="{{ 'Eliminar' | translate }}">
      <div class="cart-delete-svg-icon svg-icon-text">
        {% include "snipplets/svg/trash.tpl" %}
      </div>
    </button>
  </div>
</div>
