{% set landing_url %}{% snipplet "helpers/landing-url.tpl" %}{% endset %}
<ul class="breadcrumb {% if template != 'product'%}{% if template == 'category' and category.images is not empty %}category-image-breadcrumb{% else %}pull-left{% endif %}{% else %}product-breadcrumb{% endif %}">
    <li>
        <a class="breadcrumb-crumb" href="{{ landing_url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
    </li>
    {% for crumb in breadcrumbs %}
        <span class="breadcrumb-divider">/</span>
        {% if crumb.last %}
            <span class="breadcrumb-crumb active" style="font-weight: bold;">{{ crumb.name }}</span>
        {% else %}
            <a class="breadcrumb-crumb" href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a>
        {% endif %}
    {% endfor %}
</ul>
