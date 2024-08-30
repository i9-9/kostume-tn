<div class="container" style="min-width: 100%; padding: 0;">
    <div class="row">
        {% set num_banners = 0 %}
        {% for banner in ['banner_promotional_01', 'banner_promotional_02'] %}
            {% set banner_show = attribute(settings,"#{banner}_show") %}
            {% set banner_title = attribute(settings,"#{banner}_title") %}
            {% set banner_description = attribute(settings,"#{banner}_description") %}
            {% set has_banner =  banner_show and "#{banner}.jpg" | has_custom_image %}
            {% if has_banner %}
                {% set num_banners = num_banners + 1 %}
            {% endif %}
        {% endfor %}

        {% for banner in ['banner_promotional_01', 'banner_promotional_02'] %}
            {% set banner_show = attribute(settings,"#{banner}_show") %}
            {% set banner_title = attribute(settings,"#{banner}_title") %}
            {% set banner_description = attribute(settings,"#{banner}_description") %}
            {% set banner_url = attribute(settings,"#{banner}_url") %}
            {% set has_banner =  banner_show and "#{banner}.jpg" | has_custom_image %}
            {% set has_banner_text =  banner_title or banner_description %}
            {% if has_banner %}
                <div class="col-sm-{% if num_banners == 1 %}12{% else %}6{% endif %}" style="padding: 1px;">
                    <div class="banner-card">
                    {% if banner_url %}
                        <a class="banner-with-text-link" href="{{ banner_url | setting_url }}"{% if banner_title %} title="{{ banner_title }}" aria-label="{{ banner_title }}"{% else %} title="{{ "Banner de" | translate }} {{ store.name }}" aria-label="{{ "Banner de" | translate }} {{ store.name }}"{% endif %}>
                    {% endif %}
                        <div class="banner-with-text" style="border-radius: 0;">
                            <img class="textbanner-image-background lazyautosizes lazyload fade-in" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{ "#{banner}.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{banner}.jpg" | static_url | settings_image_url('huge') }} 640w' data-sizes="auto" {% if banner_title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} data-expand="-10"/>
                        </div>
                        {% if banner_title %}
                            <div class="banner-info-container {% if banner_url %} more-padding{% endif %}{% if not has_banner_text %} background-none{% endif %}">
                                {% if banner_title %}
                                    <h2 class="banner-with-text-title h3-xs m-none">{{ banner_title }}</h2>
                                {% endif %}
                                {% if banner_url %}
                                    <div class="btn-primary btn-circle banner-with-text-button">
                                        {% include "snipplets/svg/arrow-forward.tpl" with {fa_custom_class: "fa-xl"} %}
                                    </div>
                                {% endif %}
                            </div>
                        {% endif %}
                    {% if banner_url %}
                        </a>
                    {% endif %}
                    </div>
                </div>
            {% endif %}
        {% endfor %}
    </div>
</div>
