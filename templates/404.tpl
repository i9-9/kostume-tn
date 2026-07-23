{% set show_help = not has_products %}
{% if show_help %}
	<div class="row-fluid">
		{% include 'snipplets/defaults/show_help_product.tpl' %}
	</div>
{% else %}
	<section class="page-404" data-store="page-404">
		<header class="page-404-header">
			<h1 class="page-404-title">{{ "Página no encontrada" | translate }}</h1>
		</header>

		<div class="page-404-body">
			<p class="page-404-message">{{ "La página que estás buscando no existe." | translate }}</p>
			<a class="page-404-link" href="{{ store.products_url }}">{{ "Ver todos los productos" | translate }}</a>
			<a class="page-404-link page-404-link-secondary" href="https://www.kostumeweb.net/">{{ "Volver al inicio" | translate }}</a>
		</div>

		{% if sections.primary.products %}
			<div class="page-404-featured category-grid-container">
				<h2 class="page-404-featured-title">{{ "Productos destacados" | translate }}</h2>
				<div class="category-products-grid">
					<div class="product-row js-masonry-grid row">
						{% for product in sections.primary.products %}
							{% include 'snipplets/single_product.tpl' %}
						{% endfor %}
					</div>
				</div>
			</div>
		{% endif %}
	</section>
{% endif %}
