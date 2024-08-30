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
	<div class="js-alert-added-to-cart notification-floating notification-hidden {% if add_to_cart_fixed %}notification-fixed{% endif %}" style="display: none;">
        <div class="notification notification notification-primary">
            <div class="notification-header">
                <div class="js-cart-notification-close notification-close">
                    {% include "snipplets/svg/times.tpl" with {fa_custom_class: "icon-inline fa-2x  svg-icon-text"} %}
                </div>
            </div>
            <div class="js-cart-notification-item row" data-store="cart-notification-item">
                <div class="col-xs-3 p-right-none notification-img">
                    <img src="" class="js-cart-notification-item-img img-responsive" />
                </div>
                <div class="col-xs-9 text-left">
                    <div class="m-bottom-quarer m-right-double">
                        <span class="js-cart-notification-item-name"></span>
                        <span class="js-cart-notification-item-variant-container" style="display: none;">
                            (<span class="js-cart-notification-item-variant"></span>)
                        </span>
                    </div>
                    <div>
                        <span class="js-cart-notification-item-quantity"></span>
                        <span> x </span>
                        <span class="js-cart-notification-item-price"></span>
                    </div>
                    <strong>{{ '¡Agregado al carrito con éxito!' | translate }}</strong>
                </div>
            </div>
            <div class="notification-footer">
                <div class="row h4 font-weight-normal m-top m-bottom-half p-top-half">
                    <span class="col-xs-6 text-left">
                        <strong>{{ "Total" | translate }}</strong> 
                        (<span class="js-cart-widget-amount">
                            {{ "{1}" | translate(cart.items_count ) }} 
                        </span>
                        <span class="js-cart-counts-plural" style="display: none;">
                            {{ 'productos' | translate }}):
                        </span>
                        <span class="js-cart-counts-singular" style="display: none;">
                            {{ 'producto' | translate }}):
                        </span>
                    </span>
                    <strong class="js-cart-total col-xs-6 text-right">{{ cart.total | money }}</strong>
                </div>
                <a href="#" class="js-toggle-cart js-cart-notification-close js-fullscreen-modal-open btn btn-primary btn-medium full-width d-inline-block" data-modal-url="modal-fullscreen-cart">
                    {{ "Ver carrito" | translate }}
                </a>
            </div>
        </div>
    </div>
{% endif %}