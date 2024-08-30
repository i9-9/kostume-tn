{# Single product that works as an example #}
<div class="product-hero {% if settings.show_description_bottom %} product-form-below {% else %} product-form-aside {% endif %}">
    {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt, {class:  'product-hero-image'}) }}
    <div class="product-hero-overlay"></div>
    <div class="product-name-container {% if settings.show_description_bottom %} product-form-below m-bottom-half-xs {% endif %}">
      {# Product Name #}
      <h1 class="product-name">{{ "Producto de ejemplo" | translate }}</h1>
    </div>
</div>
<div id="single-product" class="product-detail {% if settings.show_description_bottom %} product-form-below {% endif %}">
    <div class="js-product-container container" data-variants="{{product.variants_object | json_encode }}">
        <div class="row">
          {#  Product Image and thumbnails #}
          <div class="js-product-image-container {% if settings.show_description_bottom %}col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2 {% else %} col-sm-7 col-md-7 col-lg-7 {% endif %}">
            <div class="product-image-container">
              <div class="product-image-container p-relative" style="visibility:hidden; height:0;">
                <div class="js-swiper-product product-slider no-slide-effect-md swiper-container">
                  <div class="swiper-wrapper">       
                    <li class="js-product-slide swiper-slide slider-slide product-slide" data-image="0" data-image-position="0">{{ "images/help-product-2.svg" | static_url |  img_tag(image.alt, {class: 'img-responsive product-image product-slide m-auto'}) }}</li>
                    <li class="js-product-slide swiper-slide slider-slide product-slide" data-image="1" data-image-position="1">{{ "images/help-product-44.jpg" | static_url | img_tag(image.alt, {class: 'img-responsive product-image product-slide m-auto'}) }}</li>
                    <li class="js-product-slide swiper-slide slider-slide product-slide" data-image="2" data-image-position="2">{{ "images/help-product-45.jpg" | static_url |  img_tag(image.alt, {class: 'img-responsive product-image product-slide m-auto'}) }}</li>
                  </div>
                  <div class="js-swiper-product-prev btn-circle btn-secondary swiper-button-prev swiper-button-product hidden-xs">
                    {% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-3x"} %}
                  </div>
                  <div class="js-swiper-product-next btn-circle btn-secondary swiper-button-next swiper-button-product hidden-xs">
                    {% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "svg-inline--fa fa-3x"} %}
                  </div>
                </div>
              </div>

              <div class="js-swiper-product-pagination swiper-product-pagination swiper-pagination swiper-pagination-clickable swiper-pagination-bullets full-width-container m-bottom"></div>
              <div class="hidden-xs clear-both text-center m-top full-width-container">
                <a data-slide-index="0" class="js-product-thumb product-thumb" href="">{{ "images/help-product-2.svg" | static_url |  img_tag(image.alt, {class: 'img-responsive slider-pager-image'}) }}
                </a>
                
                <a data-slide-index="1" class="js-product-thumb product-thumb" href="">{{ "images/help-product-44.jpg" | static_url |  img_tag(image.alt, {class: 'img-responsive slider-pager-image'}) }}</a>
                
                <a data-slide-index="2" class="js-product-thumb product-thumb" href="">{{ "images/help-product-45.jpg" | static_url |  img_tag(image.alt, {class: 'img-responsive slider-pager-image'}) }}</a>
                
              </div>
              {% include "snipplets/product/social-sharing.tpl" with {'mobile': false}  %}
            </div>
          </div>
          {#  Product detail, variants, description and social widgets #}
          <div class="product-form-container col-xs-12 {% if settings.show_description_bottom %} text-center text-left-xs container-fluid clear-both {% else %} text-left col-xs-12 col-sm-5 col-md-5 col-lg-5 {% endif %} m-bottom">
              {% if settings.show_description_bottom %}
              <div class="row">
              {% endif %}
                <div class="pull-left {% if settings.show_description_bottom %}col-xs-12 col-md-6 col-md-offset-3 {% else %} full-width {% endif %}">
                 {# Product Price #}
                 <div class="product-price-container {% if not settings.show_description_bottom %} p-top p-none-xs {% endif %}">
                    <h3 class="price-compare">
                        {{ "56000" | money }}
                    </h3>
                    <h2 class="product-price">{{ "82000" | money }}</h2>
                    <div class="product-labels">
                      <div class="product-label product-label-offer">
                        33% OFF
                      </div>
                    </div>
                  </div>
                </div>
                {# Product submit form  #}
                <form id="product-form" class="{% if settings.show_description_bottom %}col-xs-12 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 {% else %} full-width {% endif %}">
                    <input type="hidden" name="add_to_cart" value="{{product.id}}">
                    {# Product Variants #}
                    <div class="product-variants pull-left full-width">
                      {# Color and size variants #}
                      <div data-variant="{{ variation.name }}" class="variation_{{loop.index}} {% if not quickshop and settings.show_description_bottom %} text-center text-left-xs {% else %} text-left {% endif %} variant-container btn-variant-container">
                        <label class="variant-label" for="variation_{{loop.index}}">
                          <span>{{ "Color" | translate }}</span>
                        </label>
                       <div class="full-width">
                          <a class="js-insta-variant-empty btn-variant insta-variations blue selected">
                            <span class="btn-variant-content" style="background: lightblue;"></span>
                          </a>
                           <a class="js-insta-variant-empty btn-variant insta-variations pink">
                            <span class="btn-variant-content" style="background: pink;"></span>
                          </a>
                           <a class="js-insta-variant-empty btn-variant insta-variations green">
                            <span class="btn-variant-content" style="background: green;"></span>
                          </a>
                        </div>
                      </div>
                      {# Custom variants #}
                      <div class="variant-container">
                        <div class="desktop-product-variation row">
                          <div class="form-group select-container m-bottom-none col-xs-12 col-sm-12 {% if quickshop or not settings.show_description_bottom %}col-md-8 col-lg-8{% else %}col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4{% endif %}">
                              <label class="variant-label">
                                  <span>{{ "Material" | translate }}</span>
                              </label>
                              <select class="variant-select form-control select">
                                    <option value="Resorte" selected="selected">{{ "Denim" | translate }}</option>
                                    <option value="Ganchito">{{ "Algodón" | translate }}</option>
                              </select>
                          </div>
                        </div>
                      </div>
                    </div>    
                    <div class="row {% if product.show_installments and not product.variations %} border-none-xs p-top-none-xs {% endif %}">
                      <div class="col-xs-12 {% if settings.show_description_bottom %}col-sm-4 col-sm-offset-4 col-md-2 col-md-offset-5 col-lg-2 col-lg-offset-5 {% else %}col-sm-4 col-md-3 col-lg-3{% endif %}">
                          <div class="quantity form-group">
                              <label class="quantity-label">
                                  <strong>{{ "Cantidad" | translate }}</strong>
                              </label>
                              <input class="quantity-input form-control js-product-quantity col-xs-6" value="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}">
                          </div>
                      </div>
                    </div>
                    {#  **** Product Add to Cart button ****  #}
                    <div class="row">
                      <div class="add-to-cart col-xs-12 col-sm-12 {% if settings.show_description_bottom %} col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2 {% else %} col-md-8 col-lg-8 {% endif %}">
                          <span class="btn btn-primary cart btn-block m-bottom">{{ "Agregar al carrito" | translate }}</span>
                      </div>
                    </div>
                </form>
              {% if settings.show_description_bottom %}
                </div>
              {% endif %}
          </div>
        </div>
    </div>
</div>


{% if show_help %}
    <script type="text/javascript">
      LS.ready.then(function(){
        $(document).ready(function(){
          {# Mobile Products Slider #}

          function productSliderNav(){
            var productSwiper = new Swiper ('.js-swiper-product', {
              lazy: true,
              loop: true,
              slideActiveClass: 'js-product-active-image',
              pagination: {
                  el: '.js-swiper-product-pagination',
                  clickable: true,
              },
              navigation: {
                  nextEl: '.js-swiper-product-next',
                  prevEl: '.js-swiper-product-prev',
              },
              on: {
                  init: function () {
                    $(".js-product-slider-placeholder, .js-product-detail-loading-icon").hide();
                    $(".js-swiper-product").css({"visibility" : "visible" , "height" : "auto"});
                  },
              },
            });
            $('#color_variant').change(function(){
                var $values_color = $( "select#color_variant option:selected" ).val();
                $('#' + $values_color).click();
            });
            $(".js-insta-variant-empty").click(function(){
              $(".js-insta-variant-empty").removeClass("selected");
            });
            $(".js-insta-variant-empty.blue").click(function(){
              productSwiper.slideTo(1);
              $(this).addClass("selected");
            });
            $(".js-insta-variant-empty.pink").click(function(){
              productSwiper.slideTo(2);
              $(this).addClass("selected");
            });
            $(".js-insta-variant-empty.green").click(function(){
              productSwiper.slideTo(0);
              $(this).addClass("selected");
            });
          }
          productSliderNav ()

            

        });
      });
    </script>
{% endif %}
