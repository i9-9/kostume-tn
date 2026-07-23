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
                    <div class="search-suggest-image-container hidden-xs">
                        {{ product.featured_image | product_image_url("tiny") | img_tag(product.featured_image.alt, {class: 'search-suggest-image'}) }}
                    </div>
                    <div class="search-suggest-text full-width-xs">
                        <p class="search-suggest-name text-left m-none js-item-name">
                            {{ product.name | highlight(query) }}
                        </p>
                        {% if product.display_price %}
                        	<p class="search-suggest-price hidden-xs text-primary m-none">
                                {{ product.price | money }}
                        	</p>
                        {% endif %}
                            <span class="hidden-xs text-left">
                                <div class="item-installments">Hasta 3 cuotas sin interés</div>
                            </span>
                    </div>
                    {% include "snipplets/svg/call-made.tpl" with {fa_custom_class: "fa-xl search-suggest-icon"} %}
                </a>
            </li>
        {% endif %}
    {% endfor %}
    {% if shown > 0 %}
    <li class="search-suggest-item search-suggest-all hidden-xs">
        <a href="#" class="js-search-suggest-all-link search-suggest-link search-suggest-all-link text-underline">{{ 'Ver todos los resultados' | translate }}</a>
    </li>
    {% endif %}
</ul>
