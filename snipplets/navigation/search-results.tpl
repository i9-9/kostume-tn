<ul class="search-suggest-list">
    {% set search_suggestions = products | take(6) %}
    {% for product in search_suggestions %}
        <li class="search-suggest-item">
            <a href="{{ product.url }}" class="search-suggest-link">
                <div class="search-suggest-image-container hidden-xs">
                    {{ product.featured_image | product_image_url("tiny") | img_tag(product.featured_image.alt, {class: 'search-suggest-image'}) }}
                </div>
                <div class="search-suggest-text full-width-xs">
                    <p class="search-suggest-name text-left m-none">
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
    {% endfor %}
    <li class="search-suggest-item hidden-xs">
        <a href="#" class="js-search-suggest-all-link search-suggest-link search-suggest-all-link text-underline">{{ 'Ver todos los resultados' | translate }}</a>
    </li>
</ul>