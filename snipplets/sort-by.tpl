{% set sort_text = {
    'user': 'Destacado',
    'price-ascending': 'Precio: Menor a Mayor',
    'price-descending': 'Precio: Mayor a Menor',
    'alpha-ascending': 'A - Z',
    'alpha-descending': 'Z - A',
    'created-ascending': 'Más Viejo al más Nuevo',
    'created-descending': 'Más Nuevo al más Viejo',
    'best-selling': 'Más Vendidos',
} %}
{% set has_filters = insta_colors|length > 0 or other_colors|length > 0 or size_properties_values|length > 0 or variants_properties|length > 0 %}

<div class="row">
    <div class="{% if has_filters or show_filters %}col-sm-12 col-xs-6{% else %}col-sm-12{% endif %} form-group select-container sort-by-container m-bottom-half-xs" style="margin-bottom: 0!important;">
        {% include "snipplets/svg/arrow-down.tpl" %}
        <select id="sort" class="js-sort-by sort-by form-control select" style="text-transform: uppercase; height: 40px;">
            {% for sort_method in sort_methods %}
                {# This is done so we only show the user sorting method when the user chooses it #}
                {% if sort_method != 'user' or category.sort_method == 'user' %}
                    <option value="{{ sort_method }}" {% if sort_by == sort_method %}selected{% endif %}>{{ sort_text[sort_method] | t }}</option>
                {% endif %}
            {% endfor %}
        </select>
    </div>

    {# Mobile filters #}
    {% if has_filters or show_filters %}
        <div class="col-xs-6 p-top-double text-right visible-xs">
            <a data-target="#filters-mobile" data-modal-url="modal-fullscreen-filters" data-toggle="modal" href="#" class="js-fullscreen-modal-open d-inline-block modal-icon">
                <span class="d-inline-block align-top m-top-quarter text-primary text-uppercase">{{ 'Filtrar' | translate }}</span>
                <div class="nav-icon p-top-none">
                    {% include "snipplets/svg/filter.tpl" %}
                </div>
            </a>
        </div>
    {% endif %}

</div>
