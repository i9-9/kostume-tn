{% set selected_option = loop.first or cart.shipping_option == option.name %}
<div class="js-shipping-suboption shipping-suboption {{suboptions.name}}">
    {% if suboptions.options %}

        {# Read only suboptions inside popup #}

        {% set modal_id_val = (suboptions.name | sanitize) ~ '-pickup-modal-' ~ random() %}

        <a href="#{{ modal_id_val }}" data-toggle="modal" class="js-trigger-modal-zindex-top js-shipping-ver-direcciones btn-link btn-link-small m-top-quarter">
            {% include "snipplets/svg/location-on.tpl" with {fa_custom_class: "fa-sm svg-icon-primary"} %}
            <span>{{ 'Ver direcciones' | translate }}</span>
        </a>

        <div id="{{ modal_id_val }}" class="js-modal-shipping-suboptions shipping-pickup-modal js-modal-xs-centered modal modal-xs modal-xs-centered fade modal-zindex-top" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog shipping-pickup-modal-dialog">
                <div class="modal-content shipping-pickup-modal-content">
                    <div class="js-close-modal-zindex-top modal-header shipping-pickup-modal-header" data-dismiss="modal" aria-hidden="true">
                        <h3 class="shipping-pickup-modal-title">{{ 'Puntos de retiro' | translate }}</h3>
                        <span class="shipping-pickup-modal-close" aria-label="{{ 'Cerrar' | translate }}">
                          {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-lg"} %}
                        </span>
                    </div>
                    <div class="modal-body shipping-pickup-modal-body">
                        <ul class="shipping-pickup-list list-unstyled">
                            {% for option in suboptions.options %}
                                <li class="shipping-pickup-item">
                                    <span class="shipping-pickup-item-icon">
                                        {% include "snipplets/svg/location-on.tpl" with {fa_custom_class: "fa-sm svg-icon-text"} %}
                                    </span>
                                    <span class="shipping-pickup-item-text">{{ option.name }}</span>
                                </li>
                            {% endfor %}
                        </ul>
                    </div>
                    <div class="shipping-pickup-modal-footer">
                        <div class="shipping-pickup-modal-zip">
                            <span>{{ 'Cercanos al CP:' | translate }}</span>
                            <strong>{{ cart.shipping_zipcode }}</strong>
                        </div>
                        <div class="shipping-pickup-modal-hint">
                            {% include "snipplets/svg/info-circle.tpl" with {fa_custom_class: "fa-sm svg-icon-text"} %}
                            <span>{{ "Vas a poder elegir estas opciones antes de finalizar tu compra" | translate }}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    {% else %}
        <input type="hidden" name="{{suboptions.name}}"/>
        <div>{{ suboptions.no_options_message | translate }}</div>
    {% endif %}
</div>
