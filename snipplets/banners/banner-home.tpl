<div class="banner container">
    {% if settings.banner_home_url != '' %}
    	<a href="{{ settings.banner_home_url | setting_url }}">
    {% endif %}
            <img class="banner-image lazyload" src="{{ "banner-home.jpg" | static_url | settings_image_url('thumb')}}" data-srcset='{{ "banner-home.jpg" | static_url | settings_image_url('large') }} 480w, {{ "banner-home.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "banner-home.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "banner-home.jpg" | static_url | settings_image_url('1080p') }} 1920w' data-sizes="auto" alt="{{ "Banner de" | translate }} {{ store.name }}" />
    {% if settings.banner_home_url != '' %}
    	</a>
    {% endif %}
</div>