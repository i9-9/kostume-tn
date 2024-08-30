{% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 %}
{% if product_can_show_installments && store.country == 'AR'  %}
    <div class="js-max-installments-container">
        {% set has_payment_logos = settings.payments %}
        {% set max_installments_without_interests = product.get_max_installments(false) %}
        {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
            <h5 class="js-max-installments product-installments m-none" style="display: none;">
                <div class="d-inline">
                    {% if not has_payment_logos %}
                        {% include "snipplets/svg/credit-card.tpl" with {fa_custom_class: "fa-lg js-installments-credit-card-icon d-inline-block m-right-quarter"} %}
                    {% endif %}
                    {{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas de <strong class='js-installment-price installment-price'>{2}</strong> sin interés" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
            </h5>
        {% else %}
            {% set max_installments_with_interests = product.get_max_installments %}
            {% if max_installments_with_interests %}
                <h5 class="js-max-installments product-installments m-none" style="display: none;">
                    <div class="d-inline">
                        {% if not has_payment_logos %}
                            {% include "snipplets/svg/credit-card.tpl" with {fa_custom_class: "fa-lg js-installments-credit-card-icon d-inline-block m-right-quarter"} %}
                        {% endif %}
                        {{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas de <strong class='js-installment-price installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                </h5>
            {% else %}
                <h5 class="js-max-installments product-installments m-none" style="display: none;">
                    {% if product.max_installments_without_interests %}
                        <div class="d-inline">
                            {% if not has_payment_logos %}
                                {% include "snipplets/svg/credit-card.tpl" with {fa_custom_class: "fa-lg js-installments-credit-card-icon d-inline-block m-right-quarter"} %}
                            {% endif %}
                            {{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas de <strong class='js-installment-price installment-price'>{2}</strong> sin interés" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}
                        </div>
                    {% else %}
                            <div class="d-inline">
                                {% if not has_payment_logos %}
                                    {% include "snipplets/svg/credit-card.tpl" with {fa_custom_class: "fa-lg js-installments-credit-card-icon d-inline-block m-right-quarter"} %}
                                {% endif %}
                                {{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas de <strong class='js-installment-price installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}
                            </div>
                    {% endif %}
                </h5>
            {% endif %}
        {% endif %}
    </div>
{% endif %}
