<div class="container m-bottom">
	<div class="row">
		<div class="col-sm-12">
			<div class="js-home-products-slider-container swiper-container slider-wrapper slider-home-products-wrapper swiper-container-horizontal">
				<div class="swiper-wrapper slider-home-products-wrapper">
					{% for product in sections.slider.products %}
						{% if product.compare_at_price and product.compare_at_price > product.price %}
							{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
						{% endif %}
						{% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}
						<div class="swiper-slide slider-slide {% if sections.slider.products | length == 1 %}m-bottom{% endif %}">
							<div class="row m-none-xs">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div class="row">
										<div class="col-xs-6 text-center p-half-xs m-top-xs">
											<div class="slider-with-products-image">
												<div class="p-relative" style="padding-bottom: {{ product.featured_image.dimensions['height'] / product.featured_image.dimensions['width'] * 100}}%;">
													<a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="product-image material-radius d-block">
														<img alt="{{ product.featured_image.alt }}" data-sizes="auto" data-expand="-10" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ product.featured_image | product_image_url('small') }} 480w, {{  product.featured_image | product_image_url('huge') }} 640w" class="lazyautosizes lazyload img-absolute img-absolute-centered fade-in" />
													</a>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 m-top-half p-top-double p-left-double p-none-xs p-left-xs">
									        {#  Product price #}
							                <h2 class="h4-xs m-top-half-xs p-right-half-xs">
							                	<a href="{{ product.url }}">
								                	{% if product.name | length > 45 %}
														{{ product.name | truncate(45) }}
													{% else %}
														{{ product.name }}
													{% endif %}
												</a>
							                </h2>
									        <div class="product-price-container m-bottom-half">
								                {% if product.promotional_offer.script.is_percentage_off %}
								                    <input class="js-promotional-parameter" type="hidden" value="{{product.promotional_offer.parameters.percent}}">
								                {% endif %}
												<h3 class="js-compare-price-display price-compare border-none-xs h5-xs text-primary" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
								                    {% if product.compare_at_price %}
								                        {{ product.compare_at_price | money }}
								                    {% endif %}
								                </h3>
												<h2 class="js-price-display product-price h1 h4-xs" {% if not product.display_price %}style="display:none;"{% endif %}>
												   {% if product.display_price %}
													   {{ product.price | money }}
												   {% endif %}
											   </h2>
											   <div class="product-labels" data-store="product-item-labels">
											   		{% if product.free_shipping or product.compare_at_price or product.promotional_offer  %}
												        {% if product.promotional_offer %}
												            <div class="product-label product-label-offer label label-accent" {% if not product.display_price %}style="display:none;"{% endif %} data-store="product-item-promotion-label">
												                {% if product.promotional_offer.script.is_percentage_off %}
												                    <strong>{{ product.promotional_offer.parameters.percent * 100 }}%</strong> OFF
												                {% elseif product.promotional_offer.script.is_discount_for_quantity %}
												                	<div class="text-left">
																		<h4 class="m-none"><strong>{{ product.promotional_offer.selected_threshold.discount_decimal_percentage * 100 }}% OFF</strong></h4>
																		<div class="label-small">{{ "Comprando {1} o más." | translate(product.promotional_offer.selected_threshold.quantity) }}</div>
																	</div>
												                {% else %}
												                    {% if store.country == 'BR' %}
												                        {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
												                    {% else %}
												                        {{ product.promotional_offer.script.type }}
												                    {% endif %}
												                {% endif %}
												            </div>
												        {% else %}
												            <div class="product-label product-label-offer label label-accent {% if not product.promotional_offer %} js-offer-label {% endif %}" {% if not product.compare_at_price or product.promotional_offer or not product.display_price %}style="display:none;"{% endif %} data-store="product-item-offer-label">
												                <span class="js-offer-percentage">{{ price_discount_percentage |round }}</span>% OFF
												            </div>
												        {% endif %}
												        {% if product.free_shipping %}
												            <div class="product-label product-label-shipping">
												                <span class="product-label-icon">
												                    {% include "snipplets/svg/truck.tpl" %}
												                </span>
												                <span class="product-label-text">
												                    {{ "Gratis" | translate }}
												                </span>
												            </div>
												        {% endif %}
												        <div class="product-label product-label-no-stock js-stock-label" {% if product.has_stock %}style="display:none;"{% endif %}>{{ "Sin stock" | translate }}</div>
												    {% endif %}
												</div>
								                {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
								                <div class="m-bottom-half" data-store="product-promotion-info">
								                    {% if product.promotional_offer.script.is_discount_for_quantity %}
								                    	{% for threshold in product.promotional_offer.parameters %}
															<h5 class="text-secondary promo-title"><strong>{{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}</strong></h5>
														{% endfor %}
								                    {% else %}
								                    	<h4 class="text-secondary promo-title"><strong>{{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}</strong></h4>
								                    {% endif %}

								                    {% if product.promotional_offer.scope_type == 'categories' %}
								                        <p class="font-small promo-message">{{ "Válido para" | translate }} {{ "este producto y todos los de la categoría" | translate }}:
								                        {% for scope_value in product.promotional_offer.scope_value_info %}
								                           {{ scope_value.name }}{% if not loop.last %}, {% else %}.{% endif %}
								                        {% endfor %}</br>{{ "Podés combinar esta promoción con otros productos de la misma categoría." | translate }}</p>
								                    {% elseif product.promotional_offer.scope_type == 'all'  %}
								                        <p class="font-small promo-message">{{ "Vas a poder aprovechar esta promoción en cualquier producto de la tienda." | translate }}</p>
								                    {% endif %}
								                </div>
								                {% endif %}
									        </div>
									        {% if product.display_price %}
										        <div class="installments-container m-bottom-half clear-both">
										            {% snipplet "product/installments-in-product.tpl" %}
										        </div>
									        {% endif %}
									        <div class="row m-top m-bottom hidden-xs">
									        	<div class="container-fluid">
													<a class="btn btn-primary p-left-double p-right-double" href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">{{'Ver detalles' | translate}}</a>
									        	</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row m-top text-center visible-xs">
								<a class="btn btn-primary p-left-double p-right-double" href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">{{'Ver detalles' | translate}}</a>
							</div>
							{# Structured data to provide information for Google about the product content #}
							{% include 'snipplets/structured_data/item-structured-data.tpl' %}
						</div>
					{% endfor %}
				</div>
				{% if sections.slider.products | length > 1 %}
					<div class="js-home-products-slider-container-pagination swiper-pagination swiper-pagination-bullets">
						{% for product in sections.slider.products %}
							<span class="swiper-pagination-bullet"></span>
						{% endfor %}
					</div>
					<div class="js-home-products-slider-prev swiper-button-invert swiper-button-prev hidden-xs">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-icon-back"} %}</div>
					<div class="js-home-products-slider-next swiper-button-invert swiper-button-next hidden-xs">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-icon-back"} %}</div>
				{% endif %}
			</div>
		</div>
	</div>
</div>
