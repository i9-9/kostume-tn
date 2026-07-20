<div class="modal-with-fixed-footer">
    <div class="modal-scrollable-area">
        <div class="clear-both">
            <span class="js-modal-close btn-hamburger-close p-absolute">
                {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-xl m-top-half"} %}
            </span>
            <ul class="list-items" data-store="navigation">
                {% snipplet "navigation/navigation-hamburger-list.tpl" %}
            </ul>
        </div>
    </div>
    <div class="hamburger-panel-first-row">
        <ul class="mobile-nav-fixed-bottom clear-both">
            <div class="mobile-accounts p-top-half p-bottom-half d-flex" data-store="account-links" style="text-transform: uppercase;">
                 {% if not customer %}
                    {% if 'mandatory' not in store.customer_accounts %}
                    <li class="mobile-accounts-item border-right border-right p-right-half m-right-half text-primary">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'font-body border-bottom-none-xs border-top-none-xs text-primary')}}</li>
                    {% endif %}
                    <li class="mobile-accounts-item">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'font-body border-top-none-xs text-primary') }}</li>
                {% else %}
                    {% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %}
                    <li class="mobile-accounts-item border-right p-right-half m-right-half text-primary"> {{ "¡Hola, {1}!" | t(customer_short_name) | a_tag(store.customer_home_url, {class: 'font-body border-bottom-none-xs border-top-none-xs text-primary weight-strong'})}}</li>
                    <li class="mobile-accounts-item">{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'font-bodyborder-top-none-xs text-primary') }}</li>
                {% endif %}
            </div>
        </ul>
    </div>
</div>