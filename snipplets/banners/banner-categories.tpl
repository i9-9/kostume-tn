<div class="banner container">
    {% if settings.banner_products_url != '' %}
    	<a href="{{ settings.banner_products_url | setting_url }}">
    {% endif %}
		<img class="banner-image lazyload" src="{{ "banner-products.jpg" | static_url | settings_image_url('thumb')}}" data-srcset='{{ "banner-products.jpg" | static_url | settings_image_url('large') }} 480w, {{ "banner-products.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "banner-products.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "banner-products.jpg" | static_url | settings_image_url('1080p') }} 1920w' data-sizes="auto" />
    {% if settings.banner_products_url != '' %}
    	</a>
    {% endif %}
</div>
