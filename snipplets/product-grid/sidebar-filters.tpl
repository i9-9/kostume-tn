{% if applied_filters %}

    {# Applied filters chips #}

    {% if has_applied_filters %}
        <div class="m-bottom p-bottom-half visible-when-content-ready">
            <h5 class="weight-strong">{{ 'Filtrado por:' | translate }}</h5>
            {% for product_filter in product_filters %}
                {% for value in product_filter.values %}

                    {# List applied filters as tags #}
                    
                    {% if value.selected %}
                        <button class="js-remove-filter chip" data-filter-name="{{ product_filter.name|replace("'","%27") }}" data-filter-value="{{ value.name|replace("'","%27") }}">
                            {{ value.name }}
                            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-lg chip-remove-icon"} %}
                        </button>
                    {% endif %}
                {% endfor %}
            {% endfor %}
            <a href="#" class="js-remove-all-filters d-inline-block btn-link btn-link-primary font-small">{{ 'Borrar filtros' | translate }}</a> 
        </div>
    {% endif %}
{% else %}

    <div id="filters-column" data-store="filters-nav">  
        {% for product_filter in product_filters %}
            {% if product_filter.has_products %}
                <div class="filter-container m-top p-top-half {% if loop.first %}m-none-xs{% endif %} {% if loop.last %}m-bottom p-bottom{% endif %}" data-store="filters-group">
                    <h5 class="weight-strong m-bottom">{{product_filter.name}}</h5>
                    {% set index = 0 %}
                    {% for value in product_filter.values %}
                        {% if value.product_count > 0 %}
                            {% set index = index + 1 %}
                            <label class="js-filter-checkbox {% if not value.selected %}js-apply-filter{% else %}js-remove-filter{% endif %} checkbox-container" data-filter-name="{{ product_filter.name|replace("'","%27") }}" data-filter-value="{{ value.name|replace("'","%27") }}">
                                <span class="checkbox">
                                    <input type="checkbox" autocomplete="off" {% if value.selected %}checked{% endif %}>
                                    <span class="checkbox-icon"></span>
                                    {{ value.name }} ({{ value.product_count }})
                                    {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}
                                        <span class="checkbox-color" style="background-color: {{ value.color_hexa }};"></span>
                                    {% endif %}
                                </span>
                            </label>
                            {% if index == 8 and product_filter.values_with_products > 8 %}
                                <div class="js-accordion-container" style="display: none;">
                            {% endif %}
                        {% endif %}
                        {% if loop.last and product_filter.values_with_products > 8 %}
                            </div>
                            <a href="#" class="js-accordion-toggle btn btn-default btn-small m-top-quarter"> 
                                <span class="js-accordion-toggle-inactive"> 
                                    {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "fa-sm"} %}
                                </span>
                                <span class="js-accordion-toggle-active" style="display: none;">
                                    {% include "snipplets/svg/chevron-up.tpl" with {fa_custom_class: "fa-sm"} %}
                                </span>
                            </a>
                        {% endif %}
                    {% endfor %}
                </div>
            {% endif %}
        {% endfor %}
    </div>
{% endif %}