{% for category in categories %}
    {# asking for subcategories without images #}
    {% if category.subcategories(false) %}
        <li class="mobile-nav-list-item">
            <span data-target="js-category-{{ category.id }}" class="modal-xs-list-item js-open-mobile-subcategory">
                {{ category.name }}
            </span>
        </li>
    {% else %}
        <li class="mobile-nav-list-item">
            <a class="modal-xs-list-item" href="{{ category.url }}">
                {{ category.name }}
            </a>
        </li>
    {% endif %}
{% endfor %}
