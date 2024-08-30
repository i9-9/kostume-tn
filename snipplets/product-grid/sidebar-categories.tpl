{% if not mobile %}
    <div class="m-bottom hidden-xs">
        {% include "snipplets/product-grid/sidebar-filters.tpl" with {'applied_filters': true} %}
        {% if parent_category and parent_category.id!=0 %}
            <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back">
                {% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "fa-xs"} %} {{ parent_category.name }}
            </a>
        {% endif %}
{% endif %}
        {% if filter_categories %}
            <h5 class="weight-strong {% if mobile %}m-bottom{% endif %}">{{ "Categorías" | translate }}</h5>
            <ul class="list-style-none">
                {% for category in filter_categories %}
                    <li data-item="{{ loop.index }}" class="{% if mobile %}pill{% else %}m-bottom-half{% endif %}"><a href="{{ category.url }}" title="{{ category.name }}" {% if mobile %}class="pill-link"{% endif %}>{{ category.name }}</a></li>
                    {% if loop.index == 8 and filter_categories | length > 8 %}
                        <div class="js-accordion-container" style="display: none;">
                    {% endif %}
                    {% if loop.last and filter_categories | length > 8 %}
                        </div>
                        <a href="#" class="js-accordion-toggle full-width">
                            <span class="btn btn-default btn-small m-top-quarter"> 
                                <span class="js-accordion-toggle-inactive"> 
                                    {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "fa-sm"} %}
                                </span>
                                <span class="js-accordion-toggle-active" style="display: none;">
                                    {% include "snipplets/svg/chevron-up.tpl" with {fa_custom_class: "fa-sm"} %}
                                </span>
                            </span>
                        </a>
                    {% endif %}
                {% endfor %}
            </ul>
        {% endif %}
{% if not mobile %}
    </div>
{% endif %}
