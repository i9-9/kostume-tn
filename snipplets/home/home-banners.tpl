<div class="container banner-wrapper" data-store="banner-home-categories" style="min-width: 100%;">
    <div class="row">
        {% set num_banners = 0 %}
        {% if not sections.slider.products %}
            {% set first_banner = true %}
        {% endif %}
        {% for banner in ['banner_01', 'banner_02', 'banner_03'] %}
            {% set banner_show = attribute(settings,"#{banner}_show") %}
            {% set banner_title = attribute(settings,"#{banner}_title") %}
            {% set banner_description = attribute(settings,"#{banner}_description") %}
            {% set has_banner =  banner_show and "#{banner}.jpg" | has_custom_image %}
            {% if has_banner %}
                {% set num_banners = num_banners + 1 %}
            {% endif %}
        {% endfor %}

        {% for banner in ['banner_01', 'banner_02', 'banner_03'] %}
            {% set banner_show = attribute(settings,"#{banner}_show") %}
            {% set banner_title = attribute(settings,"#{banner}_title") %}
            {% set banner_description = attribute(settings,"#{banner}_description") %}
            {% set banner_url = attribute(settings,"#{banner}_url") %}
            {% set has_banner =  banner_show and "#{banner}.jpg" | has_custom_image %}
            {% set has_banner_text =  banner_title or banner_description %}
            {% if has_banner %}
                <div class="col-sm-{% if num_banners == 1 %}6 {% elseif num_banners == 2 %}6{% elseif num_banners == 3 %}4 col-xs-12{% if loop.last %} p-center-xs{% else %} p-center-xs{% endif %}{% endif %}" style="padding: 1px;">
                    <div class="banner-with-text{% if num_banners == 3 %} banner-with-text-three{% endif %}">
                        {% if banner_url %}
                            <a class="banner-with-text-link" href="{{ banner_url | setting_url }}" {% if banner_title %}title="{{ banner_title }}" aria-label="{{ banner_title }}"{% else %} title="{{ "Banner de" | translate }} {{ store.name }}" aria-label="{{ "Banner de" | translate }} {{ store.name }}"{% endif %} >
                        {% endif %}
                        <div class="image-container">
                            <img class="textbanner-image-background lazyload" {% if sections.slider.products %}src="{{ 'images/empty-placeholder.png' | static_url }}"{% else %}src="{{ "#{banner}.jpg" | static_url | settings_image_url('tiny') }}"{% endif %} data-srcset='{{ "#{banner}.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{banner}.jpg" | static_url | settings_image_url('huge') }} 640w' data-sizes="auto" data-expand="-10" {% if banner_title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} >
                        </div>
                        {% if has_banner_text %}
                            <div class="text-container{% if banner_url %} more-padding{% endif %}{% if not has_banner_text %} background-none{% endif %}">
                                {% if banner_title %}
                                    <h2 class="banner-with-text-title h4-xs">{{ banner_title }}</h2>
                                {% endif %}
                                {% if banner_url %}
                                    <div class="btn-primary btn-circle banner-with-text-button">
                                        {% include "snipplets/svg/arrow-forward.tpl" with {fa_custom_class: "fa-xl"} %}
                                    </div>
                                {% endif %}
                                {% if banner_description %}
                                    <div class="banner-with-text-paragraph{% if num_banners == 3 %}{% if loop.first %}{% else %} hidden-sm hidden-xs{% endif %}{% endif %}">{{ banner_description }}</div>
                                {% endif %}
                            </div>
                        {% endif %}
                        {% if banner_url %}
                            </a>
                        {% endif %}
                    </div>
                </div>
            {% if not sections.slider.products %}
                {% set first_banner = false %}
            {% endif %}
            {% endif %}
        {% endfor %}
    </div>
</div>