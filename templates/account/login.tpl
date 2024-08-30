<div class="container m-bottom">
    {% snipplet "page-header.tpl" with page_header_title =  "Iniciar sesión" | translate %}
    <div class="row m-bottom">
        <form id="login-form" action="" method="post" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3" data-store="account-login">

        {# Account validation #}
            {% if account_validation == 'success' %}
                <div class="js-account-validation-success alert alert-success m-top-half m-bottom">
                  <p>{{ "¡Tu cuenta fue creada con éxito!" | translate }}</p>
                </div>
            {% elseif account_validation == 'expired' %}
                <div class="js-account-validation-expired alert alert-danger m-top-half">
                  <p>{{ "Tu link de validación expiró." | translate }}</p>
                </div>
                <div class="m-bottom">
                  <span class="js-resend-validation-link btn-link text-underline">{{ "Enviar link de nuevo >" | translate }}</span>
                </div>
            {% elseif account_validation == 'pending' %}
                <div class="js-account-validation-pending alert alert-danger m-top-half">
                  <p>{{ "Validá tu email usando el link que te enviamos a <strong>{1}</strong> cuando creaste tu cuenta." | t(customer_email) }}</p>
                </div>
                <div class="m-bottom">
                  <p>{{ "¿No lo encontraste?" | translate }} <span class="js-resend-validation-link btn-link text-underline">{{ "Enviar link de nuevo" | translate }}</span></p>
                </div>
            {% endif %}
            <div class="js-resend-validation-success alert alert-success" style="display:none">
                <p>{{ "¡El link fue enviado correctamente!" | translate }}</p>
            </div>
            <div class="js-resend-validation-error alert alert-danger" style="display:none">
                <p>{{ "No pudimos enviar el email, intentalo de nuevo en unos minutos." | translate }}</p>
            </div>
            <div class="js-too-many-attempts alert alert-danger" style="display:none">
                <p>
                    {{ "Superaste la cantidad de intentos permitidos. Volvé a probar en" | translate }}
                    <span class="js-too-many-attempts-countdown"></span>
                </p>
            </div>

            {% include 'snipplets/facebook-login.tpl' %}

            {% if not result.facebook and result.invalid %}
                <div class="alert alert-danger">{{ 'Estos datos no son correctos. ¿Chequeaste que estén bien escritos?' | translate }}</div>
            {% endif %}
            
            <div class="form-group clear-both">
                <label for="email">{{ 'Email' | translate }}</label>
                <input type="email" autocapitalize="off" autocorrect="off" autocomplete="email" class="form-control {% if not result.facebook and result.invalid %}input-error{% endif %}" name="email" value="{{ result.email }}" required >
            </div>
            <div class="form-group p-relative">
                <label for="password">{{ 'Contraseña' | translate }}</label>
                <input type="password" name="password" class="js-password-input form-control {% if not result.facebook and result.invalid %}input-error{% endif %}" autocomplete="off" required >
                    <a aria-label="{{ 'Ver contraseña' | translate }}" class="js-password-view btn form-toggle-eye p-absolute">
                        <span class="js-eye-open" style="display: none;">
                            {% include "snipplets/svg/eye.tpl" with {fa_custom_class: "fa-sm svg-icon-primary"} %}
                        </span>
                        <span class="js-eye-closed">
                            {% include "snipplets/svg/eye-closed.tpl" with {fa_custom_class: "fa-sm svg-icon-primary"} %}
                        </span>
                    </a>
            </div>
            <small class="forgot-password">
                <a href="{{ store.customer_reset_password_url }}" class="text-primary text-underline">{{ '¿Olvidaste tu contraseña?' | translate }}</a>
            </small>
            <input class="btn btn-secondary col-xs-12 col-sm-12 col-md-5 col-lg-5 pull-right m-top m-bottom-half" type="submit" value="{{ 'Iniciar sesión' | translate }}" >
            {% if 'mandatory' not in store.customer_accounts %}
                <p class="col-xs-12 col-sm-12 pull-right m-top m-bottom-half p-none text-left-xs text-right"> {{ '¿No tenés cuenta aún?' | translate }} {{ 'Crear cuenta' | translate | a_tag(store.customer_register_url, {class: 'text-primary text-underline'}) }}</p>
            {% endif %}
        </form>
    </div>
</div>
