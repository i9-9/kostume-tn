{% if filter_categories %}
<section class="pills-container horizontal-container m-top-half-xs container-fluid visible-xs">
	<ul class="p-none m-none text-left">
		{% for category in categories %}
			<li data-item="{{ loop.index }}" class="pill {% if loop.first %} m-left-half p-left-quarter {% endif %} {% if loop.last %} p-right-half {% endif %}">
            	<a class="pill-link" href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a>
            </li>
		{% endfor %}
	</ul>
</section>
{% endif %}