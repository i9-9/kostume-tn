{% if not sections.slider.products %}

    {% set break = false %}

    {% for banner in ['banner_01', 'banner_02', 'banner_03'] if not break %}
        {% set has_banner_preload =  not sections.slider.products and (attribute(settings,"#{banner}_show") and "#{banner}.jpg" | has_custom_image) %}
        {% if has_banner_preload %}
            <link rel="preload" as="image" href="{{ "#{banner}.jpg" | static_url | settings_image_url('large') }}" imagesrcset="{{ "#{banner}.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{banner}.jpg" | static_url | settings_image_url('huge') }} 640w">  
            {% set break = true %}
        {% endif %}
    {% endfor %}
{% endif %}

{% if settings.slider or settings.slider is not empty %}
    {% for slide in settings.slider %}
        {% if loop.first %}
            <link rel="preload" as="image" href="{{ slide.image | static_url | settings_image_url('original') }}" imagesrcset="{{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w">
        {% endif %}
    {% endfor %}
{% endif %} 