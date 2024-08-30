<div class="container">
    {% snipplet "page-header.tpl" with page_header_title =  'Orden {1}' | translate(order.number)  %}
    <div class="row m-bottom-double" data-store="account-order-detail-{{ order.id }}">
        <div class="col-xs-12 col-sm-4">
            <h4 class="m-top-double m-bottom weight-strong">{{ 'Detalles' | translate }}</h4>
            <div class="material-card p-all">
                {% if log_entry %}
                    <h4>{{ 'Estado actual del envío' | translate }}:</h4>{{ log_entry }}
                {% endif %}
                <div class="m-bottom">
                    {% include "snipplets/svg/calendar.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-right-half d-table pull-left"} %}
                    <span class="d-table">{{'Fecha' | translate}}:<strong class="m-left-quarter">{{ order.date | i18n_date('%d/%m/%Y') }}</strong></span>
                </div>
                <div class="m-bottom">
                    {% include "snipplets/svg/info-circle.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-right-half d-table pull-left"} %}
                    <span class="d-table">{{'Estado' | translate}}:<strong class="m-left-quarter">{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</strong></span>
                </div>
                <div class="m-bottom">
                    {% include "snipplets/svg/credit-card-front.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-right-half d-table pull-left"} %}
                    <span class="d-table">{{'Pago' | translate}}:<strong class="m-left-quarter">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</strong></span>
                </div>
                <div class="m-bottom">
                    {% include "snipplets/svg/money-circle.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-right-half d-table pull-left"} %}
                    <span class="d-table">{{'Medio de pago' | translate}}:<strong class="m-left-quarter">{{ order.payment_name }}</strong></span>
                </div>
                {% if order.address %}
                    <div class="m-bottom">
                        {% include "snipplets/svg/truck.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-right-half d-table pull-left"} %}
                        <span class="d-table">{{'Envío' | translate}}:<strong class="m-left-quarter">{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</strong></span>
                    </div>
                    <div class="m-bottom">
                        {% include "snipplets/svg/location-on.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-right-half d-table pull-left"} %}
                        <span class="d-table"><div>{{'Dirección de envío' | translate}}:</div><strong>{{ order.address | format_address }}</strong></span>
                    </div>
                {% endif %}
            </div>
        </div>
        <div class="col-xs-12 col-sm-8 p-left-double p-left-col-xs">
            <h4 class="m-top-double m-bottom weight-strong">{{ 'Productos' | translate }}</h4>
            <div class="row m-bottom-half hidden-xs">
                <div class="col-xs-5" data-label="{{ 'Producto' | translate }}">{{ 'Producto' | translate}}</div>
                <div class="col-xs-3 text-center" data-label="{{ 'Producto' | translate }}">{{ 'Precio' | translate}}</div>
                <div class="col-xs-2 p-left-none text-left" data-label="{{ 'Producto' | translate }}">{{ 'Cantidad' | translate}}</div>
                <div class="col-xs-2 text-right" data-label="{{ 'Producto' | translate }}">{{ 'Subtotal' | translate}}</div>
            </div>
            <div class="material-card-xs p-none-xs m-bottom-half">
                {% for item in order.items %}
                    <div class="row {% if loop.index is odd %}bg-foreground{% endif %} p-top-half p-bottom-half m-none-xs">
                        <div class="col-xs-3 col-sm-2" data-label="{{ 'Producto' | translate }}">
                            <div class="card-img-square-container">
                                {{ item.featured_image | product_image_url("medium") | img_tag(item.name, {class: 'card-img-square'}) }}
                            </div>
                        </div>
                        <div class="col-xs-5 col-sm-3 weight-strong m-top p-top-quarter m-top-none-xs p-none-xs">{{ item.name }} <div class="visible-xs">x{{ item.quantity }}</div></div>
                        <div class="col-xs-3 text-center m-top p-top-quarter hidden-xs">{{ item.unit_price | money }}</div>
                        <div class="col-xs-1 text-center m-top p-top-quarter hidden-xs" data-label="{{ 'Cantidad' | translate }}">x{{ item.quantity }}</div>
                        <div class="col-xs-4 col-sm-3 text-right font-body-xs m-top p-top-quarter m-top-none-xs p-top-none-xs" data-label="{{ 'Total' | translate }}">{{ item.subtotal | money }}</div>
                    </div>
                {% endfor %}
            </div>

            {% set order_item_amount = order.items | length %}

            {% if order.shipping or order.discount %}
                <div class="row {% if order_item_amount is even %}bg-foreground{% endif %} p-top-half p-bottom-half m-none-xs">
                    <div class="col-xs-6 text-left">{{ 'Subtotal' | translate }}:</div>
                    <div class="col-xs-6 text-right weight-strong">{{ order.subtotal | money }}</div>
                </div>
            {% endif %}
            {% if order.show_shipping_price %}
                <div class="row {% if order_item_amount is odd %}bg-foreground{% endif %} p-top-half p-bottom-half m-none-xs">
                    <div class="col-xs-6 text-left">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</div>
                    {% if order.shipping == 0  %}
                        <div class="col-xs-6 text-right">{{ 'Gratis' | translate }}</div>
                    {% else %}
                        <div class="col-xs-6 text-right weight-strong">{{ order.shipping | money }}</div>
                    {% endif %}
                </div>
            {% else %}
                <div class="row {% if order_item_amount is odd %}bg-foreground{% endif %} p-top-half p-bottom-half m-none-xs">
                    <div class="col-xs-6 text-left">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</div>
                    <div class="col-xs-6 text-right weight-strong">{{ 'A convenir' | translate }}</div>
                </div>
            {% endif %}
            {% if order.discount %}
                <div class="row {% if order_item_amount is even %}bg-foreground{% endif %} p-top-half p-bottom-half m-none-xs">
                    <div class="col-xs-6 text-left">{{ 'Descuento ({1})' | translate(order.coupon) }}:</div>
                    <div class="col-xs-6 text-right weight-strong">- {{ order.discount | money }}</div>
                </div>
            {% endif %}
            <div class="row h3 m-top-none text-primary {% if (order_item_amount is even and not (order.shipping or order.discount)) or (order_item_amount is odd and order.shipping and order.discount) %}bg-foreground{% endif %} p-top-half p-bottom-half m-none-xs">
                <div class="col-xs-6 text-left"><strong>{{ 'Total' | translate }}:</strong></div>
                <div class="col-xs-6 text-right"><strong>{{ order.total | money }}</strong></div>
            </div>
            {% if order.pending %}
                <a class="btn btn-primary full-width-xs pull-right" href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{ 'Realizar el pago' | translate }}</a>
            {% endif %}
        </div>
    </div>
</div>
