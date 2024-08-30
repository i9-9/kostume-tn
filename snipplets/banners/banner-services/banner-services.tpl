{# Desktop Banner Services #}
{% macro for_each_banner_include(template) %}
    {% set num_banners_services = 0 %}
    {% set available_banners = []%}
    {% for banner in ['banner_services_01', 'banner_services_02', 'banner_services_03'] %}
        {% set banner_services_icon = attribute(settings,"#{banner}_icon") %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set banner_services_url = attribute(settings,"#{banner}_url") %}
        {% set has_banner_services =  banner_services_title or banner_services_description %}
        {% if has_banner_services %}
            {% set num_banners_services = num_banners_services + 1 %}
            {% set available_banners = available_banners | merge([banner]) %}
        {% endif %}
    {% endfor %}
    {% for banner in available_banners %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_icon = attribute(settings,"#{banner}_icon") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set banner_services_url = attribute(settings,"#{banner}_url") %}
        {% include template %}
    {% endfor %}
{% endmacro %}
{% import _self as banner_services %}

<div data-store="banner-services">
    <div class="banner-services-desktop services container hidden-xs">
        {{ banner_services.for_each_banner_include('snipplets/banners/banner-services/banner-services-item.tpl') }}
    </div>

    {# Mobile Banner Services #}
    <div class="banner-services-mobile p-top-half visible-xs">
        <div class="js-mobile-services swiper-container banner-services banner-services-slider">
            <div class="swiper-wrapper">
                {{ banner_services.for_each_banner_include('snipplets/banners/banner-services/banner-services-item.tpl') }}
            </div>
            <div class="js-mobile-service-pagination service-pagination swiper-pagination"></div>
        </div>
    </div>
</div>
