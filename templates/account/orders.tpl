<div id="account-orders" class="container m-bottom">
    {% snipplet "page-header.tpl" with page_header_title =  "Mi cuenta" | translate  %}
    <div class="row">
        <div class="col-xs-12 col-sm-4">
            <h4 class="m-top-double m-bottom weight-strong">{{ 'Mis datos' | translate }}</h4>
            <div class="material-card p-all">
                <div class="m-bottom">
                    {% include "snipplets/svg/user.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-right-half d-table pull-left"} %}
                    <span class="d-table">{{customer.name}}</span>
                </div>
                <div class="m-bottom">
                    {% include "snipplets/svg/email.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-right-half d-table pull-left"} %}
                    <span class="d-table">{{customer.email}}</span>
                </div>
                {% if customer.cpf_cnpj %}
                    <div class="m-bottom">
                        {% include "snipplets/svg/address-card.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-right-half d-table pull-left"} %} {{ 'DNI' | translate }}: {{ customer.cpf_cnpj | format_cpf_cnpj }}
                    </div>
                {% endif %}
                {% if customer.phone %}
                    <div class="m-bottom">
                        {% include "snipplets/svg/phone.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-right-half d-table pull-left"} %} 
                        <span class="d-table">{{ customer.phone }}</span>
                    </div>
                {% endif %}
                {{ 'Editar' | translate | a_tag(store.customer_info_url, '', 'btn-link btn-link-primary') }}
            </div>
            {% if customer.default_address %}
                <h4 class="m-top-double m-bottom weight-strong">{{ 'Mis direcciones' | translate }}</h4>
                <div class="material-card p-all">
                    <div class="m-bottom">
                        {% include "snipplets/svg/location-on.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-right-half d-table pull-left"} %}
                        <span class="d-table"> <strong>{{ 'Principal' | translate }}</strong> {{ customer.default_address.name }} - {{ customer.default_address | format_address_short }}</span>
                    </div>
                    {{ 'Editar' | translate | a_tag(store.customer_addresses_url, '', 'btn-link btn-link-primary') }}
                </div>
            {% endif %}
        </div>
        <div class="col-xs-12 col-sm-8">
            <h4 class="m-top-double m-bottom weight-strong">{{ 'Mis compras' | translate }}</h4>
            <div data-store="account-orders">
                {% if customer.orders %}
                    {% for order in customer.orders %}
                        {% if loop.index % 2 == 1 %}
                            <div class="row">
                        {% endif %}
                            {% set add_checkout_link = order.pending %}
                            {% set card_active = add_checkout_link ? true : false  %}
                            <div class="col-xs-12 col-sm-6 m-bottom p-bottom-half">
                                <div class="material-card p-all {% if card_active %}active{% endif %}" data-store="account-order-item-{{ order.id }}">
                                    <div class="row m-bottom-half">
                                        <div class="col-xs-6">
                                            <h5 class="font-medium m-top-none {% if card_active %}text-primary{% endif %}">
                                                {% if card_active %}
                                                    {% set active_icon_class = 'primary' %}
                                                {% else %}
                                                    {% set active_icon_class = 'text' %}
                                                {% endif %}
                                                {% include "snipplets/svg/cart.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-" ~ active_icon_class ~ " fa-md m-right-quarter"} %}
                                                <strong class="align-middle">{{'Orden' | translate}}:  <a {% if card_active %}class="text-primary"{% endif %} href="{{ store.customer_order_url(order) }}">#{{order.number}} </a></strong>
                                            </h5>
                                            
                                        </div>
                                        <div class="col-xs-6 text-right">
                                            <p class="m-none">{{ order.date | i18n_date('%d/%m/%Y') }}</p>
                                        </div> 
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 p-right-none">
                                            <div class="card-img-square-container">
                                                {% for item in order.items %}
                                                {% if loop.first %} 
                                                    {{ item.featured_image | product_image_url("") | img_tag(item.featured_image.alt, {class: 'card-img-square'}) }}
                                                {% endif %}
                                                {% endfor %}
                                            </div>
                                        </div>
                                        <div class="col-xs-8">
                                            <p class="m-bottom-quarter">
                                                {{'Pago' | translate}}: <strong class="{{ order.payment_status }}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</strong>
                                            </p>
                                            <p class="m-bottom-quarter">
                                                {{'Envío' | translate}}: <strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }} </strong>
                                            </p>
                                            <p class="m-bottom-quarter">
                                                {{'Total' | translate}} <strong>{{ order.total | money }}</strong>
                                            </p>
                                            <a class="btn-link btn-link-primary" href="{{ store.customer_order_url(order) }}"> 
                                                {% include "snipplets/svg/eye.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-sm m-right-quarter"} %}
                                                {{'Ver detalle' | translate}}
                                            </a>
                                        </div>
                                        <div class="col-xs-12 m-top">
                                            {% if add_checkout_link %}
                                                <a class="btn btn-primary btn-block" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago' | translate}}</a>
                                            {% elseif order.order_status_url != null %}
                                                <a class="btn btn-primary btn-block" href="{{ order.order_status_url | add_param('ref', 'orders_list') }}" target="_blank">{% if 'Correios' in order.shipping_name %}{{'Seguí la entrega' | translate}}{% else %}{{'Seguí tu orden' | translate}}{% endif %}</a>
                                            {% endif %}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {% if loop.index % 2 == 0 or loop.last %}
                            </div>
                        {% endif %}  
                    {% endfor %}
                {% else %}
                    <div class="material-card text-center p-top-double p-bottom-double">
                        {% include "snipplets/svg/cart.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-icon-primary d-inline-block align-baseline"} %}
                        <span class="d-inline-block text-left m-left-half">
                            <h5 class="m-bottom-quarter">{{'¡Hacé tu primera compra!' | translate}}</h5>
                            {{ 'Ir a la tienda' | translate | a_tag(store.url, '', 'btn-link btn-link-primary') }}
                        </span>    
                    </div>
                {% endif %}
            </div>
        </div>
    </div>
</div>