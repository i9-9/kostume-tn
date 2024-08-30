{% set show_help = not has_products %}
{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{#  **** Newsletter Popup ****  #}

{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}

{#  **** If home has no content and is empty shows the content below ****  #}

{% set show_help = not (settings.slider | length) and not ("banner-home.jpg" | has_custom_image) and not has_products %}

{% if show_help %}
	{% include 'snipplets/defaults/show_help.tpl' %}
{% else %}

	{# **** Welcome Message *** #}
	{% if settings.welcome_message %}
	    {% snipplet "home/welcome-message.tpl" %}
	{% endif %}

	{% if settings.slider and settings.slider is not empty %}
		{% include 'snipplets/video-home.tpl' %}
	{% endif %}
	
	{# *** Products Slider *** #}
	{% if sections.slider.products %}
		{% snipplet "home/home-products-slider.tpl" %}
	{% endif %}

	{#  **** Promotional banners ****  #}
	{% include 'snipplets/home/home-promotional-banners.tpl' %}

	{#  **** Categories banners ****  #}
	{% include 'snipplets/home/home-banners.tpl' %}

	{#  **** Primary Products Grid ****  #}

	{% if sections.primary.products %}
		{% if categories %}
	     	{% include 'snipplets/home/home-categories.tpl' %}
		{% endif %}
	    {% include 'snipplets/home/primary-products.tpl' %}
	{% endif %} 

	{#  **** Facebook and Twitter widgets ****  #}
	{% if (settings.show_footer_fb_like_box and store.facebook) or settings.twitter_widget %}
	   {% include 'snipplets/home/social-widgets.tpl' %}  
	{% endif %}

	{#  **** Banners ****  #}

	{% if "banner-home.jpg" | has_custom_image %}
		{% include 'snipplets/banners/banner-home.tpl' %}  
	{% endif %}


	{#  **** Module whith video and text ****  #}

	{% include 'snipplets/home/home-module.tpl' %}

	{#  **** Instafeed ****  #}

    {% if settings.show_instafeed %}
		{% include 'snipplets/home/instafeed.tpl' %}  
	{% endif %}

{% endif %}

