{% set has_multiple_slides = product.images_count > 1 or product.video_url %}

<div class="js-product-image-container col-xs-12 {% if settings.show_description_bottom %}col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-6 col-lg-offset-2 {% else %} col-sm-6 col-md-6 col-lg-6 {% endif %}" data-store="product-image-{{ product.id }}" style="padding:0;">
    
    {# Mobile Zoom Button #}

    <div class="visible-xs">
        <a href="#" class="js-open-mobile-zoom btn-floating m-right m-top-quarter">
            {% include "snipplets/svg/zoom-in.tpl" %}
        </a>
    </div>
    <div class="product-slider-container {% if not has_multiple_slides %}product-single-image{% endif %}">
        {% if product.images_count > 0 %}
            <div class="js-swiper-product product-slider no-slide-effect-md swiper-container swiper-container-horizontal">
                <div class="swiper-wrapper">
                    {% for image in product.images %}
                        <div class="swiper-slide js-product-slide {% if loop.first %}js-product-featured-image{% endif %} slider-slide product-slide" data-image="{{image.id}}" data-image-position="{{loop.index0}}" data-zoom-url="{{ image | product_image_url('huge') }}">
                            <a href="{{ image | product_image_url('original') }}" class="js-desktop-zoom cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
                                <img data-sizes="auto" src="{{ image | product_image_url('small') }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w' class="js-product-slide-img js-image-open-mobile-zoom product-slider-image img-absolute img-absolute-centered lazyautosizes lazyload" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
                            </a>
                        </div>
                    {% endfor %}
                    {% include 'snipplets/product/product-video.tpl' %}
                </div>
                {% if has_multiple_slides %}
                    <div class="js-swiper-product-pagination swiper-product-pagination swiper-pagination swiper-pagination-clickable swiper-pagination-bullets full-width-container m-bottom"></div>
                    <div class="js-swiper-product-prev btn-circle btn-secondary swiper-button-prev swiper-button-product hidden-xs" style="visibility: hidden;">
                        {% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-3x"} %}
                    </div>
                    <div class="js-swiper-product-next btn-circle btn-secondary swiper-button-next swiper-button-product hidden-xs" style="visibility: hidden;">
                        {% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "svg-inline--fa fa-3x"} %}
                    </div>
                {% endif %}
            </div>
        {% endif %}
    </div>
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
    {% snipplet 'placeholders/product-detail-image-placeholder.tpl' %}
</div>

<div class="js-mobile-zoom-panel mobile-zoom-panel" style="display:none;">
    <div class="js-mobile-zoom-spinner mobile-zoom-spinner">
        {% include "snipplets/svg/spinner.tpl" with { 'slider' : true, 'medium' : true } %}
    </div>
    <div class="js-mobile-zoomed-image mobile-zoom-image-container">
       {# Container to be filled with the zoomable image #}
    </div>
    <a class="js-close-mobile-zoom btn-floating m-right m-top">
        {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-lg pull-left"} %}
    </a>
</div>
