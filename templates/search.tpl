{% paginate by settings.category_quantity_products %}
<section class="search-page" data-store="search-results">
    <header class="search-page-header">
        <h1 class="search-page-title">{{ "Resultados de búsqueda" | translate }}</h1>
        {% if query %}
            <p class="search-page-query">“{{ query }}”</p>
        {% endif %}
    </header>

    {% if products %}
        <div class="search-page-grid row js-masonry-grid {% if settings.infinite_scrolling and not pages.is_last and products %} js-infinite-grid{% endif %}">
            <div class="js-masonry-grid">
                {% snipplet "product_grid.tpl" %}
            </div>
        </div>
        {% snipplet "product-grid/pagination.tpl" %}
    {% else %}
        <div class="search-empty">
            <p class="search-empty-message">{{ "No hubo resultados para tu búsqueda" | translate }}</p>
            <a class="search-empty-link" href="{{ store.products_url }}">{{ "Ver todos los productos" | translate }}</a>
        </div>
    {% endif %}
</section>
