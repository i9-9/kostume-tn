<div class="account-auth container">
    <header class="account-auth-header">
        <h1 class="account-auth-title">{{ "Crear cuenta" | translate }}</h1>
    </header>

    {% if account_validation == 'pending' %}
        <div class="account-auth-form">
            <div class="js-account-validation-pending account-auth-alert">
                <h4 class="account-auth-alert-title">{{ "¡Estás a un paso de crear tu cuenta!" | translate }}</h4>
                <p>{{ "Te enviamos un link a <strong>{1}</strong> para que valides tu email." | t(customer_email) }}</p>
            </div>
            <div class="account-auth-resend">
                <p>{{ "¿Todavía no lo recibiste?" | translate }} <span class="js-resend-validation-link account-auth-text-link">{{ "Enviar link de nuevo" | translate }}</span></p>
            </div>
            <div class="js-resend-validation-success account-auth-alert account-auth-alert-success" style="display:none">
                <p>{{ "¡El link fue enviado correctamente!" | translate }}</p>
            </div>
            <div class="js-resend-validation-error account-auth-alert account-auth-alert-error" style="display:none">
                <p>{{ "No pudimos enviar el email, intentalo de nuevo en unos minutos." | translate }}</p>
            </div>
        </div>
    {% else %}
        <form id="login-form" action="" method="post" class="account-auth-form" data-store="account-register">
            {% include 'snipplets/facebook-login.tpl' %}

            <div class="form-group account-auth-field">
                <label for="name">{{ 'Nombre' | translate }}</label>
                <input type="text" autocorrect="off" autocomplete="name" name="name" id="name" class="form-control {% if result.errors.name %}input-error{% endif %}" value="{{ result.name }}">
            </div>
            {% if result.errors.name %}
                <div class="account-auth-alert account-auth-alert-error">{{ 'Usamos tu nombre para identificar tus pedidos.' | translate }}</div>
            {% endif %}

            <div class="form-group account-auth-field">
                <label for="email">{{ 'Email' | translate }}</label>
                <input autocapitalize="off" autocorrect="off" autocomplete="email" name="email" id="email" class="form-control {% if result.errors.email == 'exists' or result.errors.email %}input-error{% endif %}" value="{{ result.email }}">
            </div>
            {% if result.errors.email == 'exists' %}
                <div class="account-auth-alert account-auth-alert-error">{{ 'Encontramos otra cuenta que ya usa este email. Intentá usando otro o iniciá sesión.' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="account-auth-alert account-auth-alert-error">{{ 'Necesitamos un email válido para crear tu cuenta.' | translate }}</div>
            {% endif %}

            <div class="form-group account-auth-field">
                <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                <input type="tel" autocorrect="off" autocomplete="tel" name="phone" id="phone" class="form-control" value="{{ result.phone }}">
            </div>

            <div class="form-group account-auth-field p-relative">
                <label for="password">{{ 'Contraseña' | translate }}</label>
                <input type="password" id="password" name="password" class="js-password-input form-control {% if (not result.facebook and result.invalid) or result.errors.password == 'required' %}input-error{% endif %}" autocomplete="off">
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
                <div class="account-auth-alert account-auth-alert-error">{{ 'Necesitamos una contraseña para registrarte.' | translate }}</div>
            {% endif %}

            <div class="form-group account-auth-field p-relative">
                <label for="password_confirmation">{{ 'Confirmar contraseña' | translate }}</label>
                <input type="password" id="password_confirmation" name="password_confirmation" class="js-password-input form-control {% if (not result.facebook and result.invalid) or result.errors.password == 'confirmation' %}input-error{% endif %}" autocomplete="off">
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
                <div class="account-auth-alert account-auth-alert-error">{{ 'Las contraseñas no coinciden.' | translate }}</div>
            {% endif %}

            <div class="g-recaptcha account-auth-recaptcha" data-sitekey="{{recaptchaSiteKey}}" data-callback="recaptchaCallback"></div>

            <input class="js-recaptcha-button btn btn-primary account-auth-submit" type="submit" value="{{ 'Crear cuenta' | translate }}" disabled>

            <p class="account-auth-switch">
                {{ '¿Ya tenés una cuenta?' | translate }}
                {{ 'Iniciá sesión' | translate | a_tag(store.customer_login_url, {class: 'account-auth-text-link'}) }}
            </p>
        </form>
    {% endif %}
</div>
