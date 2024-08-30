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
		<div class="alert alert-info empty-cart-messages">
			{% if error %}
				{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}
				<a href="{{ store.products_url }}" class="btn btn-link p-none">{{ "ver otros acá" | translate }}</a>
			{% else %}
				{{ "El carrito de compras está vacío." | translate }}
			{% endif %}
			{{ ("Ver más productos" | translate ~ " »") | a_tag(store.products_url) }}
		</div>
	{% endif %}
  	<div id="store-curr" class="hidden">{{ cart.currency }}</div>
</div>
