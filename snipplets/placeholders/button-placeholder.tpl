<div class="js-addtocart js-addtocart-placeholder btn btn-primary btn-transition btn-block m-none disabled {{ custom_class }}" style="display: none;">
    <div class="d-inline-block">
        <span class="js-addtocart-text btn-transition-start transition-container active">
            {{ 'Agregar al carrito' | translate }}
        </span>
        <span class="js-addtocart-success transition-container btn-transition-success">
            {% include "snipplets/svg/check-circle.tpl" with {fa_custom_class: "fa-lg svg-icon-invert  m-left-quarter"} %}
        </span>
        <div class="js-addtocart-adding transition-container btn-transition-progress" style="border-radius: 0;">
            <span class="m-left">
                {{ 'Agregando...' | translate }}
            </span>
            <span class="pull-right m-right">
                {% include "snipplets/svg/spinner.tpl" with {'inverse': true, fa_custom_class: 'fa-sm fa-spin fa-lg'} %}
            </span>
        </div>
    </div>
</div>