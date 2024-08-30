<div class="span2 visible-when-content-ready">
	{% include "snipplets/categories.tpl" %}
	<div class="hidden-phone">
		{% set has_filters = insta_colors|length > 0 or other_colors|length > 0 or size_properties_values|length > 0 or variants_properties|length > 0 %}

		{% if has_filters or has_applied_filters %}
			<h4 class="m-bottom p-bottom-half">{{ "Filtros" | translate }}</h4>
		{% endif %}
		{% include "snipplets/filters.tpl" with {'applied_filters': true} %}
		{% include "snipplets/filters.tpl" with {'filters_mobile': false} %}
	</div>
</div>