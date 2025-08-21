<div class="mobile-nav-tabs-container visible-xs">
    <a href="{{ store.url }}" class="mobile-nav-tab {% if store.is_catalog %} col-xs-6 {% else %} col-xs-6 {% endif %} {% if template == 'home' %} js-current-page selected {% endif %}">
        <div class="mobile-nav-tab-text" style="color: white;">{{ 'Inicio' | translate }}</div>
    </a>
    {% if not store.is_catalog %}
        {% if settings.ajax_cart %}
            <a {% if template != 'cart' %}href="#"{% endif %} class="mobile-nav-tab col-xs-6 {% if template != 'cart' %} js-toggle-cart js-fullscreen-modal-open {% else %} js-current-page selected {% endif %}" data-modal-url="modal-fullscreen-cart">
                <div class="mobile-nav-tab-text" style="color: white;">{{ 'Carrito' | translate }}</div>
            </a>
        {% else %}
            <div class="mobile-nav-tab col-xs-6 {% if template == 'cart' %} js-current-page selected {% endif %}">
            {% if cart.items_count > 0 %}
            <a href="{{ store.cart_url }}">
            {% else %}
            <a href="#" class="js-trigger-empty-cart-alert">
            {% endif %}
                <div class="mobile-nav-tab-text" style="color: white;">{{ 'Carrito' | translate }}</div>
            </a>
            </div>
        {% endif %}
    {% endif %}
</div>