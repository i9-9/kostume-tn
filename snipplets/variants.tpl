<div class="js-product-variants {% if quickshop %}js-product-quickshop-variants{% endif %}">
  <div class="row-fluid">

  {# Color and size variants (instant buttons). Include plural/common aliases used in the catalog. #}
  {% for variation in product.variations %}
    {% set variation_name_lower = variation.name|lower %}
    {% set is_instant_variant = variation_name_lower in ['color', 'cor', 'talle', 'talles', 'talla', 'tamanho', 'size'] %}
    {% if is_instant_variant %}
    <div data-variant="{{ variation.name }}" class="variation_{{loop.index}} {% if settings.product_color_variants and variation_name_lower in ['color', 'cor'] %}js-color-variant-bullet{% endif %} row-fluid variant-container btn-variant-container">
      <label class="variant-label" for="variation_{{loop.index}}">
        <span>{{variation.name}}:</span>
        <strong class="js-insta-variation-label">{{ product.default_options[variation.id] }}</strong>
      </label>
      <div class="row-fluid">
        {% for option in variation.options if option.custom_data %}
            <a data-option="{{ option.id }}" class="js-insta-variant btn-variant{% if not(variation_name_lower in ['color', 'cor']) %} btn-variant-custom{% endif %} insta-variations {{ variation.name }} {% if product.default_options[variation.id] == option.id %} selected {% endif %}">
              <span class="btn-variant-content"{% if variation_name_lower in ['color', 'cor'] %} style="background: {{ option.custom_data }}"{% endif %} data-name="{{ option.name }}">
                {% if not(variation_name_lower in ['color', 'cor']) %}
                  {{ option.name }}
                {% endif %}
              </span>
            </a>
        {% endfor %}
        {% for option in variation.options if not option.custom_data %}
            <a data-option="{{ option.id }}" class="js-insta-variant btn-variant btn-variant-custom insta-variations insta-variations_btn-custom {{ variation.name }} {% if product.default_options[variation.id] == option.id %} selected {% endif %}">
                <span class="btn-variant-content" data-name="{{ option.name }}">{{ option.name }}</span>
            </a>
        {% endfor %}
      </div>
    </div>
    {% endif %}
  {% endfor %}

  {# Custom variants #}
  {% for variation in product.variations %}
    {% set variation_name_lower = variation.name|lower %}
    {% set is_instant_variant = variation_name_lower in ['color', 'cor', 'talle', 'talles', 'talla', 'tamanho', 'size'] %}
    <div class="js-mobile-variations-container variant-container {% if is_instant_variant %} m-none {% endif %}">
      <div class="{% if not quickshop %} span8 {% else %} span12 {% endif %} desktop-product-variation {% if not is_instant_variant and not quickshop %}hidden-phone{% endif %}" {% if is_instant_variant %}style="display: none"{% endif %}>
          <label class="variant-label" for="variation_{{loop.index}}">
            <span {% if quickshop %}class="m-right-half"{% endif %}>{{variation.name}}:</span>
          </label>
          <div class="js-product-variants-group {% if variation_name_lower in ['color', 'cor'] %}js-color-variants-container{% endif %}">
            <select class="js-variation-option js-refresh-installment-data variant-select" data-variant-id="variation_{{loop.index}}" name="variation[{{ variation.id }}]">
            {% for option in variation.options %}
                <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
            {% endfor %}
            </select>
          </div>
      </div>
      {% if not is_instant_variant and not quickshop %}
        <div class="js-mobile-vars mobile-vars visible-phone">
          <a href="javascript:void(0)" class="js-mobile-vars-btn btn-module {% if quickshop %} js-quickshop-vars {% endif %}" id="{{variation.name}}">
              <h5 class="weight-normal text-wrap">{{variation.name}}:</h5>
              <span class="js-mobile-vars-selected-label text-primary text-wrap ">{{ product.default_options[variation.id] }}</span>
              <div class="btn-module-icon btn-module-icon-right">
                {% include "snipplets/svg/angle-right-regular.tpl" with {fa_custom_class: "svg-inline--fa fa-2x"} %}
              </div>  
          </a>
          <div class="js-mobile-vars-panel modal-xs modal-xs-right panel-mobile-variant modal-xs-right-out" data-custom="{{variation.name}}" {% if quickshop %}style="top: 60px;"{% endif %}>
            <div class="modal-xs-dialog">
              <a href="javascript:void(0)" class="js-close-panel modal-xs-header">
                {% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-2x modal-xs-header-icon modal-xs-right-header-icon"} %}
                <span class="modal-xs-header-text modal-xs-right-header-text">{{variation.name}}</span>
              </a>
              <div class="modal-content">
                <div class="modal-xs-body modal-xs-body-list">
                  {% for option in variation.options %}
                    <a href="javascript:void(0)" class="js-mobile-vars-property modal-xs-list-item {% if quickshop %} js-quickshop-mobile-vars-property {% endif %}" data-option="{{ option.id }}">
                      <div class="row-fluid">
                        <div class="modal-xs-radio-icon-container">
                        <span class="m-right-half modal-xs-radio-icon">
                          {% include "snipplets/svg/check.tpl" with {fa_custom_class: "svg-inline--fa"} %}
                        </span>
                        </div>
                        <div class="modal-xs-radio-text p-none-left text-wrap">
                        {{ option.name }}
                        </div>
                      </div>
                    </a>
                  {% endfor %}
                </div>
              </div>
            </div>
          </div>
        </div>
      {% endif %}
    </div>
  {% endfor %}
  </div>
</div>
