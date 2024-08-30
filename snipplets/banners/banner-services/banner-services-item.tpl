<div class="swiper-slide">
    <div class="col-xs-12{% if num_banners_services == 1 %} col-sm-4 col-sm-offset-4{% elseif num_banners_services == 2 %} col-sm-4{% elseif num_banners_services == 3 %} col-sm-4{% endif %}{% if loop.first and num_banners_services == 2 %} col-sm-offset-2{% endif %} has-{{ num_banners_services }}-banner{% if num_banners_services > 1 %}s{% endif %} m-bottom-xs">
        <div class="js-service-item service-item row text-center-xs">
            {% if banner_services_url %}
                <a href="{{ banner_services_url | setting_url }}">
            {% endif %}
        	<div class="col-xs-12 col-sm-3">
                <div class="service-icon svg-icon-text">
                    {% if banner_services_icon == 'shipping' %}
                        {% include "snipplets/svg/truck.tpl" with {fa_custom_class: "fa-xl"} %}
                    {% elseif banner_services_icon == 'card' %}
                        {% include "snipplets/svg/credit-card.tpl" with {fa_custom_class: "fa-xl"} %}
                    {% elseif banner_services_icon == 'security' %}
                        {% include "snipplets/svg/lock.tpl" with {fa_custom_class: "fa-xl"} %}
                    {% elseif banner_services_icon == 'returns' %}
                        {% include "snipplets/svg/autorenew.tpl" with {fa_custom_class: "fa-xl"} %}
                    {% elseif banner_services_icon == 'whatsapp' %}
                        {% include "snipplets/svg/whatsapp.tpl" with {fa_custom_class: "fa-xl"} %}
                    {% elseif banner_services_icon == 'promotions' %}
                        {% include "snipplets/svg/offer.tpl" with {fa_custom_class: "fa-xl"} %}
                    {% elseif banner_services_icon == 'cash' %}
                        {% include "snipplets/svg/money.tpl" with {fa_custom_class: "fa-xl"} %}
                    {% elseif banner_services_icon == 'hand' %}
                        {% include "snipplets/svg/clean-hands.tpl" with {fa_custom_class: "fa-xl"} %}
                    {% elseif banner_services_icon == 'home' %}
                        {% include "snipplets/svg/stay-home.tpl" with {fa_custom_class: "fa-xl"} %}
                    {% elseif banner_services_icon == 'office' %}
                        {% include "snipplets/svg/home-office.tpl" with {fa_custom_class: "fa-xl"} %}
                    {% endif %}
                </div>
    	    </div>
            <div class="col-xs-12 col-sm-9 service-text m-top-half">
                <h4 class="m-none text-primary opacity-80">{{ banner_services_title }}</h4>
                <p class="m-none">{{ banner_services_description }}</p>
            </div> 
            {% if banner_services_url %}
                </a>
            {% endif %}
        </div>
    </div> 
</div>    