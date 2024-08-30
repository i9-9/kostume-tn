
<div class="cart-summary p-relatve">
	{% if cart.items_count > 0 %}
	<a href="{{ store.cart_url }}">
	{% endif %}
    {% if template != 'cart' %}
       <span class="cart-summary-items m-right-quarter">{{ "{1}" | translate(cart.items_count ) }}</span>
    {% endif %}
	<span class="cart-summary-icon nav-icon">
	  {% include "snipplets/svg/cart.tpl" %}
	</span>
    {% if cart.items_count > 0 %}
	</a>
	{% endif %}
</div>

