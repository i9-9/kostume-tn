{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{#  This will replace the standard pagination if infinite scrolling is active  #}
{% if settings.infinite_scrolling and not pages.is_last and products%}
    <div class="load-more-container clear-both m-bottom text-center col-xs-12 col-sm-12 {% if template == 'category' and show_sidebar %}col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4{% else %}col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4{% endif %}">
        <a class="js-load-more-btn btn btn-secondary btn-block m-top m-bottom">
        	<span>{{ 'Mostrar más productos' | t }}</span>
		    <span class="js-load-more-spinner pull-right" style="display:none;">
		    	{% include "snipplets/svg/spinner.tpl" with {'inverse': true, fa_custom_class: 'fa-sm fa-spin'} %}
		    </span>
        </a>
    </div>
{% endif %}
{# Standard pagination #}
<div class="js-pagination-container pagination-container container-fluid text-center clear-both">
    <ul class="pagination mobile-pagination">
		{% if pages.numbers %}
			{% if pages.previous %}
				<li class="pagination-arrow-container pull-left">
		        	<a href="{{ pages.previous }}" aria-label="Previous" class="pagination-arrow-link m-bottom-quarter pull-left">
		        		<span class="pagination-arrow-prev" aria-hidden="true">
			        		{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "fa-lg pagination-icon"} %}
			        	</span>
		        	</a>
	        	</li>
		    {% endif %}
		    {% for page in pages.numbers %}
			 	{% if page.selected %}
				 	<li class="active hidden-xs">
				 		<a>
				 			{{ page.number }}
			 			</a>
				 	</li>
				 	<div class="js-page-link-{{ page.number }} pagination-input-container {% if not pages.previous %}pagination-input-container-wide{% endif %}">
				 		<span class="m-right-quarter"> 
							{{ 'Página' | t }}
						</span> 
			 			<input type="number" value="{{ page.number }}" class="js-mobile-paginator-input pagination-input text-center"/> 
			 			<span class="m-left-quarter"> 
							{{ 'de ' | t }} {{ pages.amount }}
						</span> 
					</div>
			 	{% else %}
			 		<li class="hidden-xs">
			 			<a href="{{ page.url }}" class="js-page-link-{{ page.number }} m-bottom-quarter">{{ page.number }}</a>
			 		</li>
			 	{% endif %}
			{% endfor %}
			{% if pages.next %}
				<li class="pagination-arrow-container pull-right">
			      	<a href="{{ pages.next }}" aria-label="Next" class="pagination-arrow-link m-bottom-quarter pull-right">
				        <span aria-hidden="true" class="pagination-arrow-next">
				        	{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "fa-lg pagination-icon"} %}
				        </span>
			      	</a>
			    </li>
			{% endif %}
		{% endif %}
    </ul>
</div>

