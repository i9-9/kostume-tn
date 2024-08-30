{% if settings.quick_view %}
    <div id="quickshop-modal" class="js-fullscreen-modal js-quickshop-container modal modal-xs modal-xs-right fade" tabindex="-1" role="dialog" q-hidden="true">
        <div class="modal-dialog modal-lg modal-xs-dialog">
            <div class="modal-content">
                <div class="modal-body modal-xs-body p-all-xs">
                    <div class="btn-floating-sticky">
                        <a href="#" type="button" class="js-fullscreen-modal-close btn-floating m-top-quarter m-right-quarter m-none-xs" data-dismiss="modal" aria-hidden="true">
                            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-lg"} %}
                        </a>
                    </div>
                    <div class="js-item-product" data-product-id="">
                        <div class="js-product-container js-quickshop-container js-quickshop-modal" data-variants="" data-quickshop-id="">
                            <div class="js-item-variants">
                                <div class="row-fluid">
                                    <div class="col-md-6 text-center">
                                        <div class="quickshop-img-container">
                                            <div class="js-quickshop-img-padding">
                                                <img srcset="" class="js-item-image js-quickshop-img quickshop-img"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="product-form-container m-top">
                                            <div class="js-item-name h2 product-name"></div>
                                            <div class="product-price-container m-bottom">
                                                <span class="js-compare-price-display product-price-compare price-compare h3 m-bottom-quarter-xs m-right-half"></span>
                                                <span class="js-price-display product-price h2"></span>
                                            </div>
                                            <div id="quickshop-form"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endif %}
