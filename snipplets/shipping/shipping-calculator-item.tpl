{# On first calculation select as default the first option: If store only has pickup option selects pickup else selects shipping option #}

{% if has_featured_shipping %}
    {% set checked_option = featured_option and loop.first and not pickup %}
{% else %}
    {% set checked_option = featured_option and loop.first and pickup %}
{% endif %}

{% if store.has_smart_shipping_no_auto_select %}
    {% set checked_option = false %}
{% endif %}

<li class="js-shipping-list-item radio-button-item list-item" data-store="shipping-calculator-item-{{ option.code }}">
    <label class="js-shipping-radio radio-button shipping-option" data-shipping-type="{% if pickup %}pickup{% else %}delivery{% endif %}">
        <input 
        id="{% if featured_option %}featured-{% endif %}shipping-{{loop.index}}" 
        class="js-shipping-method {% if not featured_option %}js-shipping-method-hidden{% endif %} {% if pickup %}js-pickup-option{% endif %} shipping-method" 
        data-price="{{option.cost.value}}" 
        data-code="{{option.code}}" 
        data-name="{{option.name}}" 
        data-cost="{% if option.show_price %} {% if option.cost.value == 0  %}{{ 'Gratis' | translate }}{% else %}{{option.cost}}{% endif %}{% else %} {{ 'A convenir' | translate }} {% endif %}" 
        type="radio" 
        value="{{option.code}}" 
        {% if checked_option %}checked="checked"{% endif %} name="option" 
        style="display:none" />
        <div class="radio-button-content">
            <div class="radio-button-icons-container">
                <span class="radio-button-icons">
                    <span class="radio-button-icon unchecked"></span>
                    <span class="radio-button-icon checked"></span>
                </span>
            </div>
            <div class="radio-button-label">
                <div class="shipping-option-row">
                    <div class="shipping-option-info">
                        <div class="shipping-option-name {% if option.payment_rules or option.time %}m-bottom-quarter{% endif %}">
                            {{option.short_name}} {% if option.method == 'branch' %}<span class="shipping-option-extra">{{ option.extra.extra }}</span>{% endif %}
                        </div>
                        {% if option.time %}
                            <div class="shipping-option-meta {% if option.payment_rules %}m-bottom-quarter{% endif %}">
                                {% if store.has_smart_dates %}
                                    {{option.dates}}
                                {% else %}
                                    {{option.time}}
                                {% endif %}
                            </div>
                        {% endif %}
                        {% if option.payment_rules %}
                            <div class="shipping-option-meta font-small">
                                {% include "snipplets/svg/info-circle.tpl" with {fa_custom_class: "fa-sm m-right-quarter opacity-80 align-top"} %}
                                <i>{{option.payment_rules}}</i>
                            </div>
                        {% endif %}
                        {% if option.warning['enable'] %}
                            <div class="alert alert-warning m-top m-bottom-none">
                                {{ option.warning['message'] }}
                            </div>
                        {% endif %}
                    </div>
                    {% if option.show_price %} 
                        <div class="shipping-option-price">
                            <strong class="shipping-price {% if option.cost.value == 0 %}is-free{% endif %}">
                                {% if option.cost.value == 0 %}
                                    {{ 'Gratis' | translate }}
                                {% else %}
                                    {{option.cost}}
                                {% endif %}
                            </strong>
                            {% if option.cost.value == 0 and option.old_cost.value %}
                                <span class="shipping-price-old">{{option.old_cost}}</span>
                            {% endif %}
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </label>
    {% if option.suboptions is not empty %}
        <div class="shipping-option-suboptions {% if option.payment_rules %}m-bottom-quarter{% endif %}">
            {% include "snipplets/shipping_suboptions/#{option.suboptions.type}.tpl" with {'suboptions': option.suboptions} %}
        </div>
    {% endif %}
</li>