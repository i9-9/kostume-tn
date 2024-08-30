{# Only remove this if you want to take away the theme onboarding advices #}
{# Products that work as examples #}
<section class="container m-top">
	<h3 class="description-title m-bottom text-center m-top-none">
	    {{"Productos de ejemplo" | translate}}
	</h3>
	<div class="js-masonry-grid">
		<div class="products-row row">
			{# Product 1 #}
			<div class="js-masonry-item item-container col-xs-6 col-sm-4 col-md-3 col-lg-3">
			    <div class="item">
			        <div class="item-image-container pull-left p-relative">
				    	<div class="item-labels">
				    		<div class="product-label product-label-offer">
				    			33% OFF
				    		</div>
				    	</div>
			            <a href="/product/example" title="{{ product.name }}" class="item-image-link">
			            	{% include "snipplets/svg/help-product-0.tpl" %}
			            </a>
			        </div>
			        <div class="item-info-container text-center">
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="item-name">
                            {{ "Producto de ejemplo" | translate }}
                        </a>
	                 	<div class="item-price-container d-inline-block">
		                    <span class="item-price-compare">
		                        {{"150000" | money }}
		                    </span>
		                    <span class="item-price d-inline-block m-top-none m-bottom-half h4">{{"100000" | money }}</span>
		                </div>
			        </div>
			    </div>
			</div>	
			{# Product 2 #}
			<div class="js-masonry-item item-container col-xs-6 col-sm-4 col-md-3 col-lg-3">
			    <div class="item">
			        <div class="item-image-container pull-left p-relative">
				    	<div class="item-labels">
				    		<div class="product-label product-label-shipping">
	                            <span class="product-label-icon">
	                                {% include "snipplets/svg/truck.tpl" %}
	                            </span>
	                            <span class="product-label-text">
	                                {{ "Gratis" | translate }}
	                            </span>
	                        </div>
				    	</div>
			            <a href="/product/example" title="{{ product.name }}" class="item-image-link">
			            	{% include "snipplets/svg/help-product-1.tpl" %}
			            </a>
			        </div>
			        <div class="item-info-container text-center">
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="item-name">
                            {{ "Producto de ejemplo" | translate }}
                        </a>
	                 	<div class="item-price-container d-inline-block">
		                    <span class="item-price d-inline-block m-top-none m-bottom-half h4">{{"442000" | money }}</span>
		                </div>
			        </div>
			    </div>
			</div>
			{# Product 3 #}
			<div class="js-masonry-item item-container col-xs-6 col-sm-4 col-md-3 col-lg-3">
			    <div class="item">
			        <div class="item-image-container pull-left p-relative">
				    	<div class="item-labels">
				    		<div class="product-label product-label-offer">
				    			31% OFF
				    		</div>
				    	</div>
			            <a href="/product/example" title="{{ product.name }}" class="item-image-link">
			            	{% include "snipplets/svg/help-product-2.tpl" %}
			            </a>
			        </div>
			        <div class="item-info-container text-center">
	                    <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="item-name">
	                        {{ "Producto de ejemplo" | translate }}
	                    </a>
	                 	<div class="item-price-container d-inline-block">
		                    <span class="item-price-compare">
		                        {{"82000" | money }}
		                    </span>
		                    <span class="item-price d-inline-block m-top-none m-bottom-half h4">{{"56000" | money }}</span>
		                </div>
			        </div>
			    </div>
			</div>
			
			{# Product 4 #}

			<div class="js-masonry-item item-container col-xs-6 col-sm-4 col-md-3 col-lg-3">
			    <div class="item">
			        <div class="item-image-container pull-left p-relative">
		                <a  href="/product/example" class="overlay-no-stock">
		                    <h4 class="overlay-no-stock-text h6-xs">{{ "Sin stock" | translate }}</h4>
		                </a>
			            <a href="/product/example" title="{{ product.name }}" class="item-image-link">
			            	{% include "snipplets/svg/help-product-3.tpl" %}
			            </a>
			        </div>
			        <div class="item-info-container text-center">
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="item-name">
                            {{ "Producto de ejemplo" | translate }}
                        </a>
	                 	<div class="item-price-container d-inline-block">
		                    <span class="item-price d-inline-block m-top-none m-bottom-half h4">{{"43000" | money }}</span>
		                </div>
			        </div>
			    </div>
			</div>
		</div>
		<div class="products-row row">
			{# Product 5 #}
			<div class="js-masonry-item item-container col-xs-6 col-sm-4 col-md-3 col-lg-3">
			    <div class="item">
			        <div class="item-image-container pull-left p-relative">
				    	<div class="item-labels">
				    		<div class="product-label product-label-offer">
				    			33% OFF
				    		</div>
				    	</div>
			            <a href="/product/example" title="{{ product.name }}" class="item-image-link">
			            	{% include "snipplets/svg/help-product-4.tpl" %}
			            </a>
			        </div>
			        <div class="item-info-container text-center">
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="item-name">
                            {{ "Producto de ejemplo" | translate }}
                        </a>
	                 	<div class="item-price-container d-inline-block">
		                    <span class="item-price-compare">
		                        {{"150000" | money }}
		                    </span>
		                    <span class="item-price d-inline-block m-top-none m-bottom-half h4">{{"100000" | money }}</span>
		                </div>
			        </div>
			    </div>
			</div>
			{# Product 6 #}
			<div class="js-masonry-item item-container col-xs-6 col-sm-4 col-md-3 col-lg-3">
			    <div class="item">
			        <div class="item-image-container pull-left p-relative">
				    	<div class="item-labels">
				    		<div class="product-label product-label-shipping">
	                            <span class="product-label-icon">
	                                {% include "snipplets/svg/truck.tpl" %}
	                            </span>
	                            <span class="product-label-text">
	                                {{ "Gratis" | translate }}
	                            </span>
	                        </div>
				    	</div>
			            <a href="/product/example" title="{{ product.name }}" class="item-image-link">
			            	{% include "snipplets/svg/help-product-5.tpl" %}
			            </a>
			        </div>
			        <div class="item-info-container text-center">
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="item-name">
                            {{ "Producto de ejemplo" | translate }}
                        </a>
	                 	<div class="item-price-container d-inline-block">
		                    <span class="item-price d-inline-block m-top-none m-bottom-half h4">{{"6500" | money }}</span>
		                </div>
			        </div>
			    </div>
			</div>		
			{# Product 7 #}
			<div class="js-masonry-item item-container col-xs-6 col-sm-4 col-md-3 col-lg-3">
			    <div class="item">
			        <div class="item-image-container pull-left p-relative">
				    	<div class="item-labels">
				    		<div class="product-label product-label-offer">
				    			22% OFF
				    		</div>
				    	</div>
			            <a href="/product/example" title="{{ product.name }}" class="item-image-link">
			            	{% include "snipplets/svg/help-product-6.tpl" %}
			            </a>
			        </div>
			        <div class="item-info-container text-center">
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="item-name">
                            {{ "Producto de ejemplo" | translate }}
                        </a>
	                 	<div class="item-price-container d-inline-block">
		                    <span class="item-price-compare">
		                        {{"13200" | money }}
		                    </span>
		                    <span class="item-price d-inline-block m-top-none m-bottom-half h4">{{"10200" | money }}</span>
		                </div>
			        </div>
			    </div>
			</div>		
			{# Product 8 #}
			<div class="js-masonry-item item-container col-xs-6 col-sm-4 col-md-3 col-lg-3">
			    <div class="item">
			        <div class="item-image-container pull-left p-relative">
			            <a href="/product/example" title="{{ product.name }}" class="item-image-link">
			            	{% include "snipplets/svg/help-product-7.tpl" %}
			            </a>
			        </div>
			        <div class="item-info-container clear-both text-center">
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="item-name">
                            {{ "Producto de ejemplo" | translate }}
                        </a>
	                 	<div class="item-price-container d-inline-block">
		                    <span class="item-price d-inline-block m-top-none m-bottom-half h4">{{"10000" | money }}</span>
		                </div>
			        </div>
			    </div>
			</div>
		</div>	
	</div>
</section>
