<ul class="search-suggest-list">
    {% set search_suggestions = products | take(6) %}
    {% for product in search_suggestions %}
        <li class="search-suggest-item">
            <a href="{{ product.url }}" class="search-suggest-link">
                <div class="search-suggest-image-container hidden-phone">
                    {{ product.featured_image | product_image_url("tiny") | img_tag(product.featured_image.alt, {class: 'search-suggest-image'}) }}
                </div>
                <div class="search-suggest-text text-uppercase full-width-xs">
                	<p class="search-suggest-name text-left">
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
    {% endfor %}
    <li class="search-suggest-item hidden-phone">
        <a href="#" class="js-search-suggest-all-link search-suggest-link search-suggest-all-link">{{ 'Ver todos los resultados' | translate }}</a>
    </li>
</ul>
