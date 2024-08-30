{% if product_detail %}
	{% set cart_zipcode = false %}
{% else %}
	{% set cart_zipcode = cart.shipping_zipcode %}
{% endif %}

<div class="clear-both shipping-calculator {% if product_detail %} product-shipping-calculator {% endif %}" data-store="shipping-calculator">

	{# Check if store has free shipping without regions or categories #}

	{% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

	<div class="js-shipping-calculator-head shipping-calculator-head p-relative transition-soft {% if cart_zipcode %}with-zip{% else %}with-form{% endif %} {% if has_free_shipping %}with-free-shipping{% endif %}">
		<div class="js-shipping-calculator-with-zipcode {% if cart_zipcode %}js-cart-saved-zipcode transition-up-active{% else %} p-absolute {% endif %} transition-up container-fluid full-width">

			{% if has_free_shipping %}

				{# Free shipping labels when calcualtor is hidden #}

				<div class="free-shipping-title {% if template == 'cart' or product_detail %}text-left text-center-xs{% else %}text-center{% endif %} transition-soft row">

					{# Free shipping achieved label #}

					<div class="js-free-shipping-title p-absolute transition-up full-width h4 m-none {% if cart.free_shipping.cart_has_free_shipping %}transition-up-active{% endif %}">
						<span class="weight-strong">{{ "¡Genial! <strong class='text-primary'>Tenés envío gratis</strong>" | translate }}</span>
					</div>

					{# Free shipping with min price label #}

					<div class="js-free-shipping-title-min-cost p-absolute transition-up full-width font-medium {% if not cart.free_shipping.cart_has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price %}transition-up-active{% endif %}" style="text-transform: uppercase; font-size: 11px;">
						<span class="weight-strong">{{ "<strong class='text-primary'>Envío gratis</strong> superando los" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span></span>
					</div>
				</div>

			{% endif %}
			<div class="row">
				<div class="container-fluid">
					<div class="row-flex align-items-center">
						<div class="col p-right-none">
							<span class="d-table align-icon-with-text">
								<span>{{ "Entregas para el CP:" | translate }}</span>
								<strong class="js-shipping-calculator-current-zip m-left-quarter">{{ cart_zipcode }}</strong>
							</span>
						</div>
						<div class="col-auto p-left-none">
							<a class="js-shipping-calculator-change-zipcode btn btn-default btn-small" href="#">{{ "Cambiar CP" | translate }}</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="js-shipping-calculator-form m-none transition-up p-absolute full-width" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
			<div class="p-bottom-quarter">
				<span>
					{# Free shipping achieved label #}

					<span class="js-free-shipping-message" {% if not cart.free_shipping.cart_has_free_shipping %}style="display: none;"{% endif %}>
						{{ "¡Genial! <strong class='text-primary'>Tenés envío gratis</strong>" | translate }}
					</span>

					{# Free shipping with min price label #}

					<span class="js-shipping-calculator-label" {% if cart.free_shipping.cart_has_free_shipping or not cart.free_shipping.min_price_free_shipping.min_price %}style="display: none;"{% endif %} style="text-transform: uppercase; font-weight: bold;">
						{{ "<strong class='text-primary'>Envío gratis</strong> superando los" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span>
					</span>

					{# Shipping default label #}

					<span class="js-shipping-calculator-label-default" {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}style="display: none;"{% endif %}>

						{# Regular shipping calculator label #}
						
						{{ 'Medios de envío' | translate }}
					</span>
				</span>
			</div>
			<div class="row">
				<div class="col-xs-7">
					<input type="tel" placeholder="{{ 'Tu código postal' | translate }}" aria-label="{{ 'Tu código postal' | translate }}" name="zipcode" autocorrect="off" autocomplete="postal-code" class="js-shipping-input shipping-zipcode form-control" value="{{ cart_zipcode }}" style="text-transform: uppercase; background: #171717;">
				</div>
				<div class="col-xs-5">
					<button class="js-calculate-shipping btn btn-primary btn-block" aria-label="{{ 'Calcular envío' | translate }}" style="background: #171717;
    color: white;
    border-radius: 0;
    border-color: transparent;
    height: 47px;">
						<span class="js-calculate-shipping-wording">{{ "Calcular" | translate }}</span>
						<span class="js-calculating-shipping-wording" style="display: none;">{{ "Calculando" | translate }}</span>
					</button>
				</div>
				{% if store.country == 'BR' or 'AR' or 'MX' %}
					{% set zipcode_help_ar = 'https://www.correoargentino.com.ar/formularios/cpa' %}
					{% set zipcode_help_br = 'http://www.buscacep.correios.com.br/sistemas/buscacep/' %}
					{% set zipcode_help_mx = 'https://www.correosdemexico.gob.mx/datosabiertos/gobmx/gobmx_Descarga.html' %}
						<div class="col-xs-12 m-top-half">
							<a class="btn-link font-small-extra" href="{% if store.country == 'AR' %}{{ zipcode_help_ar }}{% elseif store.country == 'BR' %}{{ zipcode_help_br }}{% elseif store.country == 'MX' %}{{ zipcode_help_mx }}{% endif %}" target="_blank">{{ "No sé mi código postal" | translate }}</a>
						</div>
				{% endif %}
				{% if shipping_calculator_variant %}
					<input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
				{% endif %}
			</div>
			<div class="js-ship-calculator-error invalid-zipcode alert alert-danger-input m-top-half" style="display: none;">
				{# Specific error message considering if store has multiple languages #}

				{% for language in languages %}
					{% if language.active %}
						{% if languages | length > 1 %}
							{% set wrong_zipcode_wording = ' para ' | translate ~ language.country_name ~ '. Podés intentar con otro o' | translate %}
						{% else %}
							{% set wrong_zipcode_wording = '. ¿Está bien escrito?' | translate %}
						{% endif %}
						{{ "No encontramos este código postal{1}" | translate(wrong_zipcode_wording) }}

						{% if languages | length > 1 %}
							<a href="#{% if product_detail %}product{% else %}cart{% endif %}-shipping-country" data-toggle="modal" class="js-trigger-modal-zindex-top btn-link btn-link-small">
								{{ 'cambiar tu país de entrega' | translate }}
							</a>
						{% endif %}
					{% endif %}
				{% endfor %}
			</div>
			<div class="js-ship-calculator-error js-ship-calculator-common-error alert alert-danger-input m-top-half" style="display: none;">
				{{ "Ocurrió un error al calcular el envío. Por favor intentá de nuevo en unos segundos." | translate }}
			</div>
			<div class="js-ship-calculator-error js-ship-calculator-external-error alert alert-danger-input m-top-half" style="display: none;">
				{{ "El calculo falló por un problema con el medio de envío. Por favor intentá de nuevo en unos segundos." | translate }}
			</div>
		</div>
	</div>
	<div class="js-shipping-calculator-spinner full-width-container m-top m-bottom transition-soft text-center" style="display: none;">
		{% include "snipplets/svg/spinner.tpl" with {multicolor: true} %}
	</div>
	<div class="js-shipping-calculator-response shipping-calculator-response {% if product_detail %}list-readonly{% endif %} m-top p-top-half" style="display: none;"></div>
</div>

{# Shipping country modal #}

{% if languages | length > 1 %}
	<div id="{% if product_detail %}product{% else %}cart{% endif %}-shipping-country" class="js-modal-shipping-country js-modal-xs-centered modal modal-xs modal-xs-centered fade modal-zindex-top modal-small" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="js-close-modal-zindex-top modal-header" data-dismiss="modal" aria-hidden="true">
					<span class="btn-floating m-right-half m-top-quarter">
				  		{% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-lg"} %}
					</span>
					<h3>{{ 'País de entrega' | translate }}</h3>
				</div>
				<div class="modal-body">
					<div class="form-group select-container">
						{% include "snipplets/svg/arrow-down.tpl" %}
						<label for="store-country">{{ 'País donde entregaremos tu compra' | t }}</label>
						<select id="store-country" class="js-shipping-country-select form-control select">
							{% for language in languages %}
								<option value="{{ language.country }}" data-country-url="{{ language.url }}" {% if language.active %}selected{% endif %}>{{ language.country_name }}</option>
							{% endfor %}
						</select>
					</div>
				</div>
				<div class="modal-footer modal-footer clear-both p-top-half">
					<a href="#" class="js-save-shipping-country btn btn-primary pull-right">{{ 'Aplicar' | translate }}</a>
				</div>
			</div>
		</div>
	</div>
{% endif %}
