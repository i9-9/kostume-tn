<ul class="search-suggest-list">
    {# Sugerencias: públicos + PS marcados; vip-protection.tpl muestra uno u otro según sesión #}
    {% set shown = 0 %}
    {% for product in products %}
        {% if shown < 12 %}
            {% set is_private_sale %}{% include 'snipplets/helpers/is-private-sale.tpl' %}{% endset %}
            {% set is_ps = is_private_sale|trim == '1' %}
            {% set shown = shown + 1 %}
            <li class="search-suggest-item{% if is_ps %} js-private-sale-product{% endif %}"{% if is_ps %} data-private-sale="true"{% endif %}>
                <a href="{{ product.url }}" class="search-suggest-link">
                    <div class="search-suggest-image-container hidden-phone">
                        {{ product.featured_image | product_image_url("tiny") | img_tag(product.featured_image.alt, {class: 'search-suggest-image'}) }}
                    </div>
                    <div class="search-suggest-text text-uppercase full-width-xs">
                    	<p class="search-suggest-name text-left js-item-name">
                    		{{ product.name | highlight(query) }}
                    	</p>
                        {% if product.display_price %}
                        	<p class="hidden-phone text-left weight-strong">
                        		{{ product.price | money }}
                        	</p>
                        {% endif %}
                            <span class="hidden-phone text-left font-small">
                                <div class="item-installments">Hasta 3 cuotas sin interés</div>
                            </span>

                    </div>
                    {% include "snipplets/svg/angle-right-regular.tpl" with {fa_custom_class: "svg-inline--fa search-suggest-icon hidden-phone svg-icon-text opacity-80"} %}
                </a>
            </li>
        {% endif %}
    {% endfor %}
    {% if shown > 0 %}
    <li class="search-suggest-item search-suggest-all hidden-phone">
        <a href="#" class="js-search-suggest-all-link search-suggest-link search-suggest-all-link">{{ 'Ver todos los resultados' | translate }}</a>
    </li>
    {% endif %}
</ul>
