{% if product.compare_at_price > product.price %}
{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}

<div id="single-product" class="product-detail js-product-detail js-shipping-calculator-container js-has-new-shipping {% if settings.show_description_bottom %} product-form-below {% endif %}" style="width: 100%; margin-top: 10px;">
    <div class="js-product-container container" data-variants="{{product.variants_object | json_encode }}" style="width: 100%;">
        <div class="row">
            {# Product Image and thumbnails #}
            {% include 'snipplets/product/product-image.tpl' %}
            {#  Product detail, variants, description and social widgets #}
            <div class="product-form-container col-xs-12 {% if settings.show_description_bottom %} text-center text-left-xs container-fluid clear-both {% else %} text-left col-xs-12 col-sm-4 col-md-4 col-lg-4 {% endif %} m-bottom" data-store="product-info-{{ product.id }}" style="padding-left: 30px;">
                {% if settings.show_description_bottom %}
                <div class="row">
                {% endif %}
                    {# Product price #}
                    <div class="row" style="margin-top: 0;">
                            <h5 id="product-name" class="product-name col-lg-10" style="margin-top: 0; font-weight: bold;" itemprop="name" data-store="product-name-{{ product.id }}">{{ product.name }}</h5>
                            <div class="product-price-container {% if not settings.show_description_bottom %} p-none-xs {% endif %} col-lg-2" data-store="product-price-{{ product.id }}">
                            {% if product.promotional_offer.script.is_percentage_off %}
                                <input class="js-promotional-parameter" type="hidden" value="{{product.promotional_offer.parameters.percent}}">
                            {% endif %}
                            <h3 class="js-compare-price-display price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                                {% if product.compare_at_price %}
                                    {{ product.compare_at_price | money }}
                                {% endif %}
                             </h3>
                            <h5 class="js-price-display product-price" {% if product.display_price %}style="display:inline-block;"{% endif %}>
                                {% if product.display_price %}
                                    {{ product.price | money }}
                                {% endif %}
                            </h5>
                            <div class="product-labels m-bottom" data-store="product-item-labels">
                                {% if product.promotional_offer %}
                                    <div class="product-label product-label-offer label label-accent" {% if not product.display_price %}style="display:none;"{% endif %} data-store="product-item-promotion-label">
                                        {% if product.promotional_offer.script.is_percentage_off %}
                                            <strong>{{ product.promotional_offer.parameters.percent * 100 }}%</strong> OFF
                                        {% elseif product.promotional_offer.script.is_discount_for_quantity %}
                                            <div>
                                                <h4 class="m-none"><strong>{{ product.promotional_offer.selected_threshold.discount_decimal_percentage * 100 }}% OFF</strong></h4>
                                                <div class="label-small">{{ "Comprando {1} o más." | translate(product.promotional_offer.selected_threshold.quantity) }}</div>
                                            </div>
                                        {% else %}
                                            {% if store.country == 'BR' %}
                                                {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                                            {% else %}
                                                {{ product.promotional_offer.script.type }}
                                            {% endif %}
                                        {% endif %}
                                    </div>
                                {% else %}
                                    <div class="product-label product-label-offer label label-accent {% if not product.promotional_offer %} js-offer-label {% endif %}" {% if not product.compare_at_price or product.promotional_offer or not product.display_price %}style="display:none;"{% endif %} data-store="product-item-offer-label">
                                        <span class="js-offer-percentage">{{ price_discount_percentage |round }}</span>% OFF
                                    </div>
                                {% endif %}
                                {% if product.free_shipping %}
                                    <div class="product-label product-label-shipping">
                                        <span class="product-label-icon">
                                            {% include "snipplets/svg/truck.tpl" %}
                                        </span>
                                        <span class="product-label-text">
                                            {{ "Gratis" | translate }}
                                        </span>
                                    </div>
                                {% endif %}
                                <div class="product-label product-label-no-stock js-stock-label" {% if product.has_stock %}style="display:none;"{% endif %}>{{ "Sin stock" | translate }}</div>
                            </div>
                            <span class="hidden" data-store="stock-product-{{ product.id }}-{% if product.has_stock %}{% if product.stock %}{{ product.stock }}{% else %}infinite{% endif %}{% else %}0{% endif %}"></span>
                    </div>
                    <div class="pull-left {% if settings.show_description_bottom %}col-xs-12 col-md-6 col-md-offset-3 {% else %} full-width {% endif %}">
                            {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
                            <div data-store="product-promotion-info">
                                {% if product.promotional_offer.script.is_discount_for_quantity %}
                                    {% for threshold in product.promotional_offer.parameters %}
                                        <h4 class="text-primary promo-title"><strong>{{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}</strong></h4>
                                     {% endfor %}
                                {% else %}
                                    <h4 class="text-primary promo-title"><strong>{{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}</strong></h4>
                                {% endif %}
                                {% if product.promotional_offer.scope_type == 'categories' %}
                                    <p class="font-small promo-message">{{ "Válido para" | translate }} {{ "este producto y todos los de la categoría" | translate }}:
                                    {% for scope_value in product.promotional_offer.scope_value_info %}
                                       {{ scope_value.name }}{% if not loop.last %}, {% else %}.{% endif %}
                                    {% endfor %}</br>{{ "Podés combinar esta promoción con otros productos de la misma categoría." | translate }}</p>
                                {% elseif product.promotional_offer.scope_type == 'all'  %}
                                    <p class="font-small promo-message">{{ "Vas a poder aprovechar esta promoción en cualquier producto de la tienda." | translate }}</p>
                                {% endif %}
                            </div>
                            {% endif %}
                        </div>
                                                {# Product Installments button and info #}
                        <div class="m-bottom-half container-fluid display-when-content-ready">
                            <div class="row">
                                {% if product.show_installments and product.display_price %}
                                    {% set installments_info_base_variant = product.installments_info %}
                                    {% set installments_info = product.installments_info_from_any_variant %}
                                    {% if installments_info %}
                                        <a href="#installments-modal" data-toggle="modal" data-modal-url="modal-fullscreen-payments" class="js-fullscreen-modal-open js-product-payments-container js-refresh-installment-data link-module {% if settings.show_description_bottom %} text-center text-left-xs {% else %} text-left {% endif %}" {% if (not product.get_max_installments) and (not product.get_max_installments(false)) %}style="display: none;"{% endif %} style="margin-left: 14px;">
                                            {% set has_payment_logos = settings.payments %}
                                            {% if has_payment_logos %}
                                                <div hclass="m-left-none m-bottom-quarter">
                                                    <ul class="list-style-none">
                                                        {% for payment in settings.payments %}
                                                            {# Payment methods flags #}
                                                            {% if store.country == 'BR' %}
                                                                {% if payment in ['visa', 'mastercard'] %}
                                                                    <li class="d-inline-block">
                                                                        <span class="js-product-detail-payment-logo">
                                                                            <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ payment | payment_new_logo }}" class="lazyload product-payment-logos-img card-img" alt="{{ payment }}" />
                                                                        </span>
                                                                    </li>
                                                                {% endif %}
                                                            {% else %}
                                                                {% if payment in ['visa', 'amex', 'mastercard'] %}
                                                                    <li class="d-inline-block">
                                                                        <span class="js-product-detail-payment-logo">
                                                                            <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ payment | payment_new_logo }}" class="lazyload product-payment-logos-img card-img" alt="{{ payment }}" />
                                                                        </span>
                                                                    </li>
                                                                {% endif %}
                                                            {% endif %}
                                                        {% endfor %}
                                                        <li class="d-inline-block">
                                                            <span class="js-product-detail-payment-logo p-relative svg-icon-text opacity-80">
                                                                {% include "snipplets/svg/credit-card.tpl" with { 'payment': true } %}
                                                                {% include "snipplets/svg/add.tpl" with { 'payment': true } %}
                                                            </span>
                                                        </li>   
                                                    </ul>
                                                </div>
                                            {% endif %}
                                            {# Cash discount #}
                                            {% if custom_payment.discount > 0 %}
                                              <div class="span12 m-left-none m-bottom-half">
                                                <span class="text-tertiary"><strong>{{ custom_payment.discount }}% {{'de descuento' | translate }}</strong> {{'pagando con' | translate }} {{ custom_payment.name }}</span>
                                              </div>
                                            {% endif %}
                                            {% if product.show_installments and product.display_price %}
                                                <div id="btn-installments" class="btn-link clear-both" {% if (not product.get_max_installments) and (not product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                                                    {% set store_set_for_new_installments_view = store.is_set_for_new_installments_view %}
                                                    {% if store_set_for_new_installments_view %}
                                                        {{ "Ver medios de pago" | translate }}
                                                    {% else %}
                                                        {{ "Ver el detalle de las cuotas" | translate }}
                                                    {% endif %}
                                                </div>
                                                <div class="visible-xs link-module-icon-right">
                                                    {% include "snipplets/svg/angle-right.tpl" %}
                                                </div>
                                            {% endif %}
                                        </a>
                                    {% endif %}
                                {% endif %}
                            </div>
                        </div>
                    </div>
                    {#  **** Product submit form ****  #}
                    {% snipplet 'product/product-form.tpl' %}
                    {# Product Description #}
                    {% if product.description != '' %}
                    <div class="col-xs-12 product-user-description clear-both m-bottom display-when-content-ready" data-store="product-description-{{ product.id }}" style="padding-left: 0;">
                        <div class="user-content">
                            {{ product.description }}
                        </div>
                    </div>
                    {% endif %}
                        {% if has_multiple_slides %}
        <div class="hidden-xs clear-both text-center m-top full-width-container">
            <div class="product-thumbnails-slider">
                {% for image in product.images %}
                    <a href="#" class="js-product-thumb product-thumb {% if loop.first %}active{% endif %}" data-slide-index="{{loop.index0}}">
                        <img src="{{ image | product_image_url('small') }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w' class="product-thumb-image lazyautosizes lazyload blur-up" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
                    </a>
                {% endfor %}
                
                {# Video thumb #}

                {% include 'snipplets/product/product-video.tpl' with {thumb: true} %}
            </div>
        </div>
    {% endif %}

                    {% snipplet 'placeholders/product-detail-form-placeholder.tpl' %}
                </div>
            </div>
            {% if settings.show_product_fb_comment_box %}
                {# facebook-comments-user-description-container class is used for external app JS #}
                <div class="facebook-comments-user-description-container col-xs-12 display-when-content-ready">
                    {# Facebook Comments Box #}
                    <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                </div>
            {% endif %}
        </div>
    </div>
</div>

{# Related Products #}
{% include 'snipplets/product-grid/related-products.tpl' %}

{# Payments details #}

{% include 'snipplets/product/payments/payments.tpl' %}

{# Sharing mobile modal 
<div class="modal modal-xs fade modal-xs-bottom" id="sharing-mobile" tabindex="-1" role="dialog" q-hidden="true">
    <div class="modal-xs-dialog">
        <a class="modal-xs-header visible-xs" href="#" data-dismiss="modal">
            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-lg modal-xs-header-icon"} %}
            <span class="modal-xs-header-text">
                {{ 'Compartir ' | translate }} {{ product.name }}
            </span>
        </a>
        <div class="modal-content">
            <div class="modal-xs-body">
                <div class="modal-header hidden-xs">
                    <span class="btn btn-floating pull-right" data-dismiss="modal" aria-label="Close">
                      {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-lg "} %}
                    </span>
                    <h4 class="modal-title col-xs-10 p-none m-top-half">{{ 'Compartir ' | translate }}<strong>{{ product.name }}</strong>{{ ' en:' | translate }}</h4>
                </div>
                <div class="modal-body modal-xs-body">
                    {% include "snipplets/product/social-sharing.tpl" with {'mobile': true} %}
                </div>
            </div>
        </div>
    </div>
</div> #}

{# Product video modal on mobile #}

{% include 'snipplets/product/product-video.tpl' with {product_video_modal: true} %}