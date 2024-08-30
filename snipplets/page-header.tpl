{% if template == 'category' %}
	{% if category.images is not empty %}
		{% set image_sizes = ['small', 'large', 'huge', 'original', '1080p'] %}
		{% set category_images = [] %}

		{% for size in image_sizes %}
			{# Define images for admin categories #}
		    {% set category_images = category_images|merge({(size):(category.images | first | category_image_url(size))}) %}
		{% endfor %}
	{% endif %}

	<div class="container-fluid {% if category.images is not empty %} category-image-container{% endif %}">
{% endif %}

		<div class="title-container{% if category.images is empty %} row{% endif %} p-relative" data-store="page-title">
			<div class="col-xs-12" style="text-transform: uppercase; display: flex;
					justify-content: space-between;
					align-items: center;
					padding: 0 15px;
					margin-bottom: 10px;">
			{% if template == 'category' %}
				<div class="breadcrumb-product" 
				style="display: inline-block; 
					width: fit-content;">
					{% snipplet 'navigation/breadcrumbs.tpl' %}
				</div>
			{% endif %}
				<div class="category-controls visible-when-content-ready pull-none-xs col-xs-12 col-sm-2 col-md-2 col-lg-2 pull-right text-right" style="margin: 0; padding: 0;">
                {% if template == 'category' %}
					{% snipplet 'sort-by.tpl' %}
				{% endif %}
                {% if show_filters %}
                    {% snipplet 'product-grid/sidebar.tpl' %}
                {% endif %}
            </div>

		</div>

{% if template == 'category' %}
	{% if category_images %}
		<img class="category-image lazyautosizes lazyload" src="{{ category_images['small'] }}" data-srcset="{{ category_images['large'] }} 480w, {{ category_images['huge'] }} 640w, {{ category_images['original'] }} 1024w, {{ category_images['1080p'] }} 1920w" data-sizes="auto" alt="{{ 'Banner de la categoría' | translate }} {{ category.name }}" />
	{% endif %}
	</div>

	{% if category.description %}
		<div class="container text-center">
			<div class="row category-description-container {% if category_images %}with-image{% endif %} material-card">
				<div class="col-sm-12 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
					<p class="m-top-half m-top-none-xs">{{ category.description }}</p>
				</div>
			</div>
		</div>
	{% endif %}
{% endif %}