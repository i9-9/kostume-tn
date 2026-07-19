{# shopingCartPage ID is important for AJAX functionality #}
<div id="shoppingCartPage" class="container" data-minimum="{{ settings.cart_minimum_value }}">
	{% snipplet "page-header.tpl" with page_header_title =  "Carrito de compras" | translate  %}
	{% if cart.items %}
        {% if error.add %}
            <div class="alert alert-warning">{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn btn-link p-none">{{ "ver otros acá" | translate }}</a></div>
        {% endif %}
        {% for error in error.update %}
        	<div class="alert alert-warning">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
        {% endfor %}
        {% snipplet 'cart/cart-form.tpl' %}
	{% else %}
        {#  Empty cart  #}
		<div class="cart-empty-state empty-cart-messages">
			{% if error %}
				<p class="cart-empty-state-text">
					{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}
					<a href="{{ store.products_url }}" class="btn-link p-none">{{ "ver otros acá" | translate }}</a>
				</p>
			{% else %}
				<p class="cart-empty-state-text">{{ "El carrito de compras está vacío." | translate }}</p>
				<a href="{{ store.products_url }}" class="cart-empty-state-link">{{ "Ver más productos" | translate }}</a>
			{% endif %}
		</div>
	{% endif %}
  	<div id="store-curr" class="hidden">{{ cart.currency }}</div>
</div>
