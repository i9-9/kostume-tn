{% set theme_version = settings.version_theme %}
<section class="js-home-slider-container slider-wrapper container{% if theme_version == 'full' %}-fluid{% endif %}{% if settings.slider_full_height %} full-height{% endif %} p-none p-relative {% if not settings.slider or settings.slider is empty %}hidden{% endif %}" data-store="slider-main">
    <div class="js-home-slider home-slider swiper-container swiper-container-horizontal">
        <div class="swiper-wrapper">
            {% for slide in settings.slider %}
                <div class="swiper-slide slide-container">
                    {% if not slide.link is empty %}
                    <a href="{{ slide.link | setting_url }}">
                    {% endif %}
                        <img {% if loop.first %}src="{{ slide.image | static_url | settings_image_url('original') }}" srcset="{{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" class="slide-img"{% else %}src="{{ slide.image | static_url | settings_image_url('tiny') }}" data-srcset="{{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" class="slide-img blur-up-huge swiper-lazy" data-sizes="auto"{% endif %} alt="{{ 'Imagen del carrusel' | translate }} {{ loop.index }}"/>
                    {% if not slide.link is empty %}
                    </a>
                    {% endif %}
                </div>
            {% endfor %}
        </div>
        
        <div class="js-swiper-home-pagination swiper-pagination swiper-pagination-bullets">
            {% if settings.slider > 1 and not params.preview %}
                {% for slide in settings.slider %}
                    <span class="swiper-pagination-bullet"></span>
                {% endfor %}
            {% endif %}
        </div>
        <div class="js-swiper-home-prev swiper-button-invert swiper-button-prev hidden-xs">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-icon-back"} %}</div>
        <div class="js-swiper-home-next swiper-button-invert swiper-button-next hidden-xs">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-icon-back"} %}</div>
    </div>   
</section>
