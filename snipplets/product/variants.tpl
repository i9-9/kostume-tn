<div class="js-product-variants {% if quickshop %}js-product-quickshop-variants{% else %}product-variants{% endif %} pull-left full-width">
  {# Color and size variants #}
  {% for variation in product.variations if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size'] %}
      <div data-variant="{{ variation.name }}" class="variation_{{loop.index}} {% if settings.product_color_variants and variation.name in ['Color', 'Cor'] %}js-color-variant-bullet{% endif %} {% if not quickshop and settings.show_description_bottom %} text-center text-left-xs {% else %} text-left {% endif %} variant-container btn-variant-container">
        <label class="variant-label" for="variation_{{loop.index}}">
            <span>{{variation.name}}</span>
          <strong class="js-insta-variation-label">{{ product.default_options[variation.id] }}</strong>
        </label>
        <div class="full-width">
          {% for option in variation.options if option.custom_data %}
              <a data-option="{{ option.id }}" class="js-insta-variant btn-variant{% if not(variation.name in ['Color', 'Cor']) %} btn-variant-custom{% endif %} insta-variations {{ variation.name }} {% if product.default_options[variation.id] == option.id %} selected {% endif %}">
                <span class="btn-variant-content"{% if variation.name in ['Color', 'Cor'] %} style="background: {{ option.custom_data }}"{% endif %} data-name="{{ option.name }}">
                  {% if not(variation.name in ['Color', 'Cor']) %}
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
  {% endfor %}
  {# Custom variants #}
  {% for variation in product.variations %}
    <div class="js-mobile-variations-container variant-container {% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%} m-none {% endif %}">
      <div class="desktop-product-variation row {% if not quickshop %}hidden-xs{% endif %}" {% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%} style="display: none" {% endif %}>
        <div class="js-product-variants-group {% if variation.name in ['Color', 'Cor'] %}js-color-variants-container{% endif %} form-group select-container m-bottom-none {% if not quickshop %}m-bottom-xs{% endif %} col-xs-12 col-sm-12 {% if quickshop or not settings.show_description_bottom %}col-md-8 col-lg-8{% else %}col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3{% endif %}">
          <label class="variant-label" for="variation_{{loop.index}}">
              {{variation.name}}
          </label>
          <select class="js-variation-option js-refresh-installment-data form-control select" data-variant-id="variation_{{loop.index}}" name="variation[{{ variation.id }}]" style="padding: 0; border-bottom: 2px solid #fff;">
              {% for option in variation.options %}
                  <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
              {% endfor %}
          </select>
          <div class="form-control-icon">
            {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "fa-sm"} %}          
          </div>
        </div>
      </div>
      {% if not(variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']) and not quickshop %}
        <div class="js-mobile-vars mobile-vars visible-xs">
          <a href="javascript:void(0)" class="js-mobile-vars-btn btn-module {% if quickshop %} js-quickshop-vars {% endif %}" id="{{variation.name}}" style="{% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}display:none;{% endif %}">
              <p class="text-wrap m-none">{{variation.name}}</p>
              <span class="js-mobile-vars-selected-label text-primary text-wrap">{{ product.default_options[variation.id] }}</span>
              <div class="btn-module-icon-right link-module-icon m-right-none">
                {% include "snipplets/svg/angle-right.tpl" %}
              </div>  
          </a>
          <div class="js-mobile-vars-panel modal-xs modal-xs-right panel-mobile-variant modal-xs-right-out" data-custom="{{variation.name}}" style="{% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}display:none;{% endif %}">
            <div class="modal-xs-dialog">

              <a href="javascript:void(0)" class="js-close-panel modal-xs-header">
                {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-md modal-xs-header-icon modal-xs-right-header-icon"} %}
                <span class="modal-xs-header-text modal-xs-right-header-text">{{variation.name}}</span>
              </a>
              <div class="modal-xs-body modal-xs-body-list">
              {% for option in variation.options %}
                <a href="javascript:void(0)" class="js-mobile-vars-property modal-xs-list-item {% if quickshop %} js-quickshop-mobile-vars-property {% endif %}" data-option="{{ option.id }}">
                  <div class="row-fluid">
                    <div class="modal-xs-radio-icon-container">
                    <span class="m-right-half modal-xs-radio-icon">
                      {% include "snipplets/svg/radio-check.tpl" with {fa_custom_class: "fa-lg icon-checked"} %}
                      {% include "snipplets/svg/radio-uncheck.tpl" with {fa_custom_class: "fa-lg icon-unchecked"} %}
                    </span>
                    </div>
                    <div class="modal-xs-radio-text p-left-none text-wrap">
                    {{ option.name }}
                    </div>
                  </div>
                </a>
                {% endfor %}
              </div>
            </div>
          </div>
        </div>
      {% endif %}
    </div>
  {% endfor %}
</div>
