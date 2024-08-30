{% paginate by settings.category_quantity_products %}
<div class="container" style="padding: 15px; width: 100%;">
    {% snipplet "page-header.tpl" with page_header_title = "Resultados de búsqueda" | translate  , hide_breadcrumbs = true %}
    {% if products %}
       <div class="row js-masonry-grid {% if settings.infinite_scrolling and not pages.is_last and products%} js-infinite-grid {% endif %}">
	       	<div class="js-masonry-grid">
	            {% snipplet "product_grid.tpl" %}
	        </div>
        </div>
        {% snipplet "product-grid/pagination.tpl" %}
    {% else %}
        <h5 class="m-double-bottom" 
        style="padding: 15px;
        text-transform: uppercase;
        font-size: 12px;">{{ "No hubo resultados para tu búsqueda" | translate }}</h5>
    {% endif %}
</div>
