<section class="products-grid primary-products-grid container" data-store="products-home-featured">
    <h4 class="m-top-none m-bottom p-left-half-xs">{{ "Productos destacados" | translate }}</h4>
    <div class="product-row js-masonry-grid row">
            {% for product in sections.primary.products %}
                    {% include 'snipplets/single_product.tpl' %}
            {% endfor %}
    </div>
    <div class="text-center p-left-half p-right-half full-width d-inline-block m-bottom m-top">
        <a href="{{ store.products_url }}" class="btn btn-secondary col-xs-12 col-sm-4 col-sm-offset-4 col-md-4 col-md-offset-4 m-bottom-half">{{ "Ver todos los productos" | translate }}</a>
    </div>
</section>