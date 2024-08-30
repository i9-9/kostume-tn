<section class="pills-container home-categories horizontal-container container m-bottom{% if not settings.home_main_categories %} visible-xs{% endif %}">
	<ul class="list-unstyled m-bottom-half-neg text-center text-left-xs">
		<li class="m-left-half m-right-quarter d-inline">{{ "Categorías" | translate }}:</li>
		{% for category in categories %}
			<li data-item="{{ loop.index }}" class="pill{% if loop.last %} p-right-half {% endif %}">
            	<a class="pill-link" href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a>
            </li>
		{% endfor %}
	</ul>
</section>
