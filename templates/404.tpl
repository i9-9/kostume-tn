{% set show_help = not has_products %}
{# Here we will add an example as a help, you can delete this after you upload your products #}
{% if show_help %}
		<div class="row-fluid">
			{% include 'snipplets/defaults/show_help_product.tpl' %}
		</div>
	{% else %}
		<div class="container">
			<div class="text-center">
			      {% snipplet "page-header.tpl" with page_header_title = "La página no existe" | translate  , hide_breadcrumbs = true %}
			  </div>
		  	<div class="text-center">
			    {% include "snipplets/svg/alert.tpl" with {fa_custom_class: "fa-5x opacity-50"} %}
			</div>
		    <h4 class="text-center">{{ "La página que estás buscando no existe." | translate }}</h4>
		    <h4 class="text-center border-bottom p-bottom text-primary">{{ "Quizás te interesen los siguientes productos." | translate }}</h4>
		</div>
		{% include 'snipplets/home/primary-products.tpl' %}
{% endif %}
