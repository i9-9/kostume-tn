{# Mobile Filters #}
<div class="js-fullscreen-modal modal modal-xs fade modal-xs-bottom" id="filters-mobile" tabindex="-1" role="dialog" q-hidden="true">
    <div class="modal-xs-dialog">
        <a class="js-fullscreen-modal-close modal-xs-header visible-xs" href="#" data-dismiss="modal">
            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-xl modal-xs-header-icon"} %}
            <span class="modal-xs-header-text">
                {{ 'Filtrar por' | translate }}
            </span>
        </a>
        <div class="modal-content">
            <div class="modal-body modal-xs-body">
                {% include "snipplets/product-grid/sidebar-categories.tpl" with {'mobile': true} %}
                {% include "snipplets/product-grid/sidebar-filters.tpl" with {'mobile': true} %}
        	</div>
    	</div>
    </div>
</div>
<div class="js-filters-overlay filters-overlay" style="display: none;">
    <div class="filters-updating-message">
        <h3 class="js-applying-filter" style="display: none;">{{ 'Aplicando filtro...' | translate }}</h3>
        <h3 class="js-removing-filter" style="display: none;">{{ 'Borrando filtro...' | translate }}</h3>
    </div>
</div>