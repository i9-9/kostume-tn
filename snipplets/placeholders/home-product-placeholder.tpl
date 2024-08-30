{# Mobile home slider placeholder: to be hidden after content loaded #}
<div class="js-home-product-placeholder container">
    <div class="slider-wrapper slider-home-products-wrapper">
        <div class="mobile-placeholder">
            <div class="overflow-none container">
                <div class="row">
                    <div class="col-xs-6 p-half-xs m-top-half">
                        <div class="placeholder-square placeholder-color">
                            <div class="placeholder-icon col-xs-8">{% include "snipplets/svg/offer.tpl" %}</div>
                        </div>
                    </div>
                    <div class="col-xs-6 m-top-half p-none-xs p-left-xs">
                        {#  Product price #}
                        {% for product in sections.slider.products %}                            
                            {% if loop.first %}
                            <h2 class="h4-xs m-top-half-xs p-right-half-xs">
                                <a href="{{ product.url }}">
                                    {% if product.name | length > 45 %}
                                        {{ product.name | truncate(45) }}
                                    {% else %}
                                        {{ product.name }}
                                    {% endif %}
                                </a>
                            </h2>
                            {% endif %}
                        {% endfor %}
                        <div class="col-xs-6 placeholder-line placeholder-color-primary small">
                        </div>
                        <div class="col-xs-8 placeholder-line placeholder-color m-top-half">
                        </div>
                    </div>
                </div>
                {% for product in sections.slider.products %}
                    {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}
                    
                    {% if loop.first %}
                        <div class="row m-top text-center">
                            <a class="btn btn-primary p-left-double p-right-double" href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">{{'Ver detalles' | translate}}</a>
                        </div>
                    {% endif %}
                {% endfor %}
            </div>
            {% if sections.slider.products > 1 %}
                <div class="js-home-product-placeholder slider-pager">
                    {% for product in sections.slider.products %}
                        <span class="slider-pager-link slider-pager-circle d-inline-block {% if loop.first %}active {% endif %}"></span>
                    {% endfor %}
                </div>
            {% endif %}
            <div class="placeholder-shine">
            </div>
        </div>
    </div>
</div>