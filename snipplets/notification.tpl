{# Cookie validation #}

{% if show_cookie_banner and not params.preview %}
    <div class="js-notification js-notification-cookie-banner notification notification-fixed-bottom notification-foreground notification-above text-left" style="display: none;">
        <div>
            <div class="pull-left m-top-quarter m-top-none-xs">{{ 'Al navegar por este sitio <strong>aceptás el uso de cookies</strong> para agilizar tu experiencia de compra.' | translate }}</div>
            <div class="text-right pull-right m-top-xs m-right-double m-right-none-xs">
                <a href="#" class="js-notification-close js-acknowledge-cookies btn btn-primary btn-notification">{{ "Entendido" | translate }}</a>
            </div>
        </div>
    </div>
{% endif %}

{# Order notification #}

{% if show_order_cancellation %}
    <div class="js-notification js-notification-order-cancellation notification notification-fixed-bottom notification-secondary" data-url="{{ status_page_url }}" style="display:none;">
        <a href="{{ store.contact_url }}?order_cancellation=true"><strong>{{ "Botón de arrepentimiento" | translate }}</strong></a>
        <a class="js-notification-close js-notification-order-cancellation-close pull-right notification-close" href="#">
            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-lg"} %}</a>
        </a>
    </div>
{% endif %}

{% if order_notification and status_page_url %}
    <div class="js-notification js-notification-status-page notification notification-secondary" data-url="{{ status_page_url }}" style="display:none;">
        <a href="{{ status_page_url }}"><strong>{{ "Seguí acá" | translate }}</strong> {{ "tu última compra" | translate }}</a>
        <a class="js-notification-close js-notification-status-page-close pull-right notification-close" href="#">
            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-lg"} %}
        </a>
    </div>
{% endif %}

{# Add to cart notification #}

{% if add_to_cart %}
	<div class="js-alert-added-to-cart cart-toast notification-floating notification-hidden {% if add_to_cart_fixed %}notification-fixed{% endif %}" style="display: none;">
        <div class="cart-toast-card notification notification-primary">
            <button type="button" class="js-cart-notification-close cart-toast-close" aria-label="{{ 'Cerrar' | translate }}">
                {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-lg svg-icon-text"} %}
            </button>

            <div class="cart-toast-status">
                {{ 'Agregado al carrito' | translate }}
            </div>

            <div class="js-cart-notification-item cart-toast-item" data-store="cart-notification-item">
                <div class="cart-toast-img">
                    <img src="" class="js-cart-notification-item-img" alt="" />
                </div>
                <div class="cart-toast-info">
                    <div class="cart-toast-name">
                        <span class="js-cart-notification-item-name"></span>
                        <span class="js-cart-notification-item-variant-container cart-toast-variant" style="display: none;">
                            <span class="js-cart-notification-item-variant"></span>
                        </span>
                    </div>
                    <div class="cart-toast-meta">
                        <span class="js-cart-notification-item-quantity"></span>
                        <span class="cart-toast-meta-sep">×</span>
                        <span class="js-cart-notification-item-price"></span>
                    </div>
                </div>
            </div>

            <div class="cart-toast-footer">
                <div class="cart-toast-total">
                    <span class="cart-toast-total-label">
                        {{ "Total" | translate }}
                        <span class="cart-toast-total-count">
                            <span class="js-cart-widget-amount">{{ cart.items_count }}</span>
                            <span class="js-cart-counts-plural" style="display: none;">{{ 'productos' | translate }}</span>
                            <span class="js-cart-counts-singular" style="display: none;">{{ 'producto' | translate }}</span>
                        </span>
                    </span>
                    <strong class="js-cart-total cart-toast-total-price">{{ cart.total | money }}</strong>
                </div>
                <a href="#" class="js-toggle-cart js-cart-notification-close js-fullscreen-modal-open cart-toast-cta btn btn-primary" data-modal-url="modal-fullscreen-cart">
                    {{ "Ver carrito" | translate }}
                </a>
            </div>
        </div>
    </div>
{% endif %}
