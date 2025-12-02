<div class="container m-bottom">
    {#  **** Page header ****  #}
    {% snipplet "page-header.tpl" with page_header_title =  "Crear cuenta" | translate  %}

{# Account validation #}
    {% if account_validation == 'pending' %}
        <div class="row">
            <div class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
                <div class="js-account-validation-pending alert alert-primary text-align-left">
                    {% include "snipplets/svg/email.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary fa-md m-bottom-half"} %}
                    <h4 class="weight-strong">{{ "¡Estás a un paso de crear tu cuenta!" | translate }}</h4>
                    <p class="font-small">{{ "Te enviamos un link a <strong>{1}</strong> para que valides tu email." | t(customer_email) }} </p>
                </div>
                <div class="text-center m-bottom font-small">
                    <p>{{ "¿Todavía no lo recibiste?" | translate }} <span class="js-resend-validation-link btn-link text-underline">{{ "Enviar link de nuevo" | translate }}</span></p>
                </div>
                <div class="js-resend-validation-success alert alert-success" style="display:none">
                    <p>{{ "¡El link fue enviado correctamente!" | translate }}</p>
                </div>
                <div class="js-resend-validation-error alert alert-danger" style="display:none">
                    <p>{{ "No pudimos enviar el email, intentalo de nuevo en unos minutos." | translate }}</p>
                </div>
            </div>
        </div>
    {% else %}

        {#  **** Register account form ****  #}
        <div class="register-form row m-bottom">
            <form id="login-form" action="" method="post" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3" data-store="account-register">
                {#  **** Facebook Login Button ****  #}
                {% include 'snipplets/facebook-login.tpl' %}
                <div class="form-group clear-both">
                    <label for="name">{{ 'Nombre' | translate }}</label>
                    <input type="text" autocorrect="off" autocomplete="name" name="name" id="name" class="form-control {% if result.errors.name %}input-error{% endif %}" value="{{ result.name }}" placeholder="{{ 'María Perez' | translate }}">
                </div>
                {% if result.errors.name %}
                    <div class="alert alert-danger-input m-bottom-double">{{ 'Usamos tu nombre para identificar tus pedidos.' | translate }}</div>
                {% endif %}
                <div class="form-group">
                    <label for="email">{{ 'Email' | translate }}</label>
                    <input autocapitalize="off" autocorrect="off" autocomplete="email" name="email" id="email" class="form-control {% if result.errors.email == 'exists' or result.errors.email %}input-error{% endif %}" value="{{ result.email }}" placeholder="{{ 'tunombre@email.com' | translate }}">
                </div>
                {% if result.errors.email == 'exists' %}
                    <div class="alert alert-danger-input m-bottom-double">{{ 'Encontramos otra cuenta que ya usa este email. Intentá usando otro o iniciá sesión.' | translate }}</div>
                {% elseif result.errors.email %}
                    <div class="alert alert-danger-input m-bottom-double">{{ 'Necesitamos un email válido para crear tu cuenta.' | translate }}</div>
                {% endif %}
                <div class="form-group">
                    <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                    <input type="tel" autocorrect="off" autocomplete="tel" name="phone" id="phone" class="form-control" value="{{ result.phone }}" placeholder="{{ '1123445567' | translate }}">
                </div>
                <div class="form-group p-relative">
                    <label for="password">{{ 'Contraseña' | translate }}</label>
                    <input type="password" name="password" class="js-password-input form-control {% if (not result.facebook and result.invalid) or result.errors.password == 'required' %}input-error{% endif %}" autocomplete="off"> 
                    <a aria-label="{{ 'Ver contraseña' | translate }}" class="js-password-view btn form-toggle-eye p-absolute">
                        <span class="js-eye-open" style="display: none;">
                            {% include "snipplets/svg/eye.tpl" with {fa_custom_class: "fa-sm svg-icon-primary"} %}
                        </span>
                        <span class="js-eye-closed">
                            {% include "snipplets/svg/eye-closed.tpl" with {fa_custom_class: "fa-sm svg-icon-primary"} %}
                        </span>
                    </a>
                </div>
                 {% if result.errors.password == 'required' %}
                    <div class="alert alert-danger-input m-bottom-double">{{ 'Necesitamos una contraseña para registrarte.' | translate }}</div>
                {% endif %}
                <div class="form-group p-relative">
                    <label for="password_confirmation">{{ 'Confirmar contraseña' | translate }}</label>
                    <input type="password" name="password_confirmation" class="js-password-input form-control {% if (not result.facebook and result.invalid) or result.errors.password == 'confirmation' %}input-error{% endif %}" autocomplete="off">
                    <a aria-label="{{ 'Ver contraseña' | translate }}" class="js-password-view btn form-toggle-eye p-absolute">
                        <span class="js-eye-open" style="display: none;">
                            {% include "snipplets/svg/eye.tpl" with {fa_custom_class: "fa-sm svg-icon-primary"} %}
                        </span>
                        <span class="js-eye-closed">
                            {% include "snipplets/svg/eye-closed.tpl" with {fa_custom_class: "fa-sm svg-icon-primary"} %}
                        </span>
                    </a>
                </div>
                {% if result.errors.password == 'confirmation' %}
                    <div class="alert alert-danger-input m-bottom-double">{{ 'Las contraseñas no coinciden.' | translate }}</div>
                {% endif %}
                {# Google reCAPTCHA #}
                <div class="g-recaptcha" data-sitekey="{{recaptchaSiteKey}}" data-callback="recaptchaCallback"></div>
                <input class="js-recaptcha-button btn btn-secondary col-xs-12 col-sm-12 col-md-7 col-lg-7 pull-right" type="submit" value="{{ 'Crear cuenta' | translate }}" disabled>
                <p class="col-xs-12 col-sm-12 pull-right m-top m-bottom-half p-none text-left-xs text-right"> {{ '¿Ya tenés una cuenta?' | translate }} {{ 'Iniciá sesión' | translate | a_tag(store.customer_login_url, {class: 'text-primary text-underline'}) }}</p>
            </form>
        </div>
    {% endif %}
</div>
