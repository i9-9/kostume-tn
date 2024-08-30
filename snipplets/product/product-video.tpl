{% if product.video_url %}

	{% if product_video_modal %}

		{# Product video modal wrapper for mobile #}

		<div id="modal-product-video" class="js-fullscreen-modal modal fade modal-xs modal-xs-right bottom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xs-dialog">
				 <div class="modal-header">
					<a class="js-fullscreen-modal-close modal-xs-header visible-xs" href="#" data-dismiss="modal">
						{% include "snipplets/svg/arrow-back.tpl" with {fa_custom_class: "fa-xl modal-xs-header-icon modal-xs-right-header-icon"} %}
						<span class="modal-xs-header-text modal-xs-right-header-text text-trim">{{ "Video de" | translate }} {{ product.name }}
						</span>
					</a>
				 </div>
				 <div class="modal-content p-none">
					<div class="modal-body modal-xs-body p-none">
						{# Empty iframe component: will be filled with JS on play button click #}
						<div class="js-product-video-modal video-modal">
							<div class="js-video-iframe embed-responsive embed-responsive-16by9" style="display: none;" data-video-color="{{ settings.brand_color | trim('#') }}"></div>
						</div>
					</div>
				 </div>
			</div>
		</div>
	{% else %}

		{# Product video slide #}
		
		{% if product.images_count > 1 %}
			{% set video_index = product.images_count %}
		{% else %}
			{% set video_index = 1 %}
		{% endif %}
	{% endif %}
{% endif %}