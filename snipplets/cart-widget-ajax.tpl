<div class="cart-summary p-relative">
    <a href="#" class="js-toggle-cart js-fullscreen-modal-open" data-modal-url="modal-fullscreen-cart">
		{% if template != 'cart' %}
			<span class="js-cart-widget-amount cart-summary-items">{{ "{1}" | translate(cart.items_count ) }}</span>
		{% endif %}
		<span class="cart-summary-icon nav-icon">
		  {% include "snipplets/svg/cart.tpl" %}
		</span>
	</a>
</div>
