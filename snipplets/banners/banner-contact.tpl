<div class="banner container m-top">
    {% if settings.banner_contact_url != '' %}
    	<a href="{{ settings.banner_contact_url | setting_url }}">
    {% endif %}
            <img class="banner-image lazyautosizes lazyload blur-up" src="{{ "banner-contact.jpg" | static_url | settings_image_url('thumb')}}" data-srcset='{{ "banner-contact.jpg" | static_url | settings_image_url('large') }} 480w, {{ "banner-contact.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "banner-contact.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "banner-contact.jpg" | static_url | settings_image_url('1080p') }} 1920w' data-sizes="auto" />
    {% if settings.banner_contact_url != '' %}
    	</a>
    {% endif %}
</div>