<div id="related-products" class="container-fluid m-top m-bottom" data-store="related-products">
    {% set related_products = [] %}
    {% set related_products_ids_from_app = product.metafields.related_products.related_products_ids %}
    {% set has_related_products_from_app = related_products_ids_from_app | get_products | length > 0 %}
    {% if has_related_products_from_app %}
        {% set related_products = related_products_ids_from_app | get_products %}
    {% endif %}
    {% if related_products is empty %}
        {% set max_related_products_length = 4 %}
        {% set max_related_products_achieved = false %}
        {% set related_products_without_stock = [] %}
        {% set max_related_products_without_achieved = false %}
        
        {% set products_from_category = category.products | shuffle %}
        {% for product_from_category in products_from_category if not max_related_products_achieved and product_from_category.id != product.id %}
            {%  if product_from_category.stock is null or product_from_category.stock > 0 %}
                {% set related_products = related_products | merge([product_from_category]) %}
            {% elseif (related_products_without_stock | length < max_related_products_length) %}
                {% set related_products_without_stock = related_products_without_stock | merge([product_from_category]) %}
            {% endif %}
            {%  if (related_products | length == max_related_products_length) %}
                {% set max_related_products_achieved = true %}
            {% endif %}
        {% endfor %}
        {% if (related_products | length < max_related_products_length) %}
            {% set number_of_related_products_for_refill = max_related_products_length - (related_products | length) %}
            {% set related_products_for_refill = related_products_without_stock | take(number_of_related_products_for_refill) %}
            
            {% set related_products = related_products | merge(related_products_for_refill)  %}
        {% endif %}
    {% endif %}

    {% if related_products | length > 0 %}
        <div class="related-products-header m-bottom">
            <h5 class="h4-xs" style="text-transform: uppercase; font-weight: bold;">{{ "Recomendados" | translate }}</h5>
        </div>
        <div class="js-masonry-desktop product-row row horizontal-container horizontal-products-container overide-container-width-xs">
            <ul class="horizontal-products-scroller p-left-quarter-xs m-left-half-xs">
            {% for related in related_products %}
                {% include 'snipplets/single_product.tpl' with {product : related, 'related_product': true} %}
            {% endfor %}
            </ul>
        </div>
    {% endif %}
</div>