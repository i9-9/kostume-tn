<div class="account-auth container">
    <header class="account-auth-header">
        <h1 class="account-auth-title">{{ "Iniciar sesión" | translate }}</h1>
    </header>

    <form id="login-form" action="" method="post" class="account-auth-form" data-store="account-login">

        {# Account validation #}
        {% if account_validation == 'success' %}
            <div class="js-account-validation-success account-auth-alert account-auth-alert-success">
                <p>{{ "¡Tu cuenta fue creada con éxito!" | translate }}</p>
            </div>
        {% elseif account_validation == 'expired' %}
            <div class="js-account-validation-expired account-auth-alert account-auth-alert-error">
                <p>{{ "Tu link de validación expiró." | translate }}</p>
            </div>
            <div class="account-auth-resend">
                <span class="js-resend-validation-link account-auth-text-link">{{ "Enviar link de nuevo" | translate }}</span>
            </div>
        {% elseif account_validation == 'pending' %}
            <div class="js-account-validation-pending account-auth-alert account-auth-alert-error">
                <p>{{ "Validá tu email usando el link que te enviamos a <strong>{1}</strong> cuando creaste tu cuenta." | t(customer_email) }}</p>
            </div>
            <div class="account-auth-resend">
                <p>{{ "¿No lo encontraste?" | translate }} <span class="js-resend-validation-link account-auth-text-link">{{ "Enviar link de nuevo" | translate }}</span></p>
            </div>
        {% endif %}
        <div class="js-resend-validation-success account-auth-alert account-auth-alert-success" style="display:none">
            <p>{{ "¡El link fue enviado correctamente!" | translate }}</p>
        </div>
        <div class="js-resend-validation-error account-auth-alert account-auth-alert-error" style="display:none">
            <p>{{ "No pudimos enviar el email, intentalo de nuevo en unos minutos." | translate }}</p>
        </div>
        <div class="js-too-many-attempts account-auth-alert account-auth-alert-error" style="display:none">
            <p>
                {{ "Superaste la cantidad de intentos permitidos. Volvé a probar en" | translate }}
                <span class="js-too-many-attempts-countdown"></span>
            </p>
        </div>

        {% include 'snipplets/facebook-login.tpl' %}

        {% if not result.facebook and result.invalid %}
            <div class="account-auth-alert account-auth-alert-error">{{ 'Estos datos no son correctos. ¿Chequeaste que estén bien escritos?' | translate }}</div>
        {% endif %}

        <div class="form-group account-auth-field">
            <label for="email">{{ 'Email' | translate }}</label>
            <input type="email" id="email" autocapitalize="off" autocorrect="off" autocomplete="email" class="form-control {% if not result.facebook and result.invalid %}input-error{% endif %}" name="email" value="{{ result.email }}" required>
        </div>
        <div class="form-group account-auth-field p-relative">
            <label for="password">{{ 'Contraseña' | translate }}</label>
            <input type="password" id="password" name="password" class="js-password-input form-control {% if not result.facebook and result.invalid %}input-error{% endif %}" autocomplete="off" required>
            <a aria-label="{{ 'Ver contraseña' | translate }}" class="js-password-view btn form-toggle-eye p-absolute">
                <span class="js-eye-open" style="display: none;">
                    {% include "snipplets/svg/eye.tpl" with {fa_custom_class: "fa-sm svg-icon-primary"} %}
                </span>
                <span class="js-eye-closed">
                    {% include "snipplets/svg/eye-closed.tpl" with {fa_custom_class: "fa-sm svg-icon-primary"} %}
                </span>
            </a>
        </div>

        <div class="account-auth-forgot">
            <a href="{{ store.customer_reset_password_url }}" class="account-auth-text-link">{{ '¿Olvidaste tu contraseña?' | translate }}</a>
        </div>

        <input class="btn btn-primary account-auth-submit" type="submit" value="{{ 'Iniciar sesión' | translate }}">

        {% if 'mandatory' not in store.customer_accounts %}
            <p class="account-auth-switch">
                {{ '¿No tenés cuenta aún?' | translate }}
                {{ 'Crear cuenta' | translate | a_tag(store.customer_register_url, {class: 'account-auth-text-link'}) }}
            </p>
        {% endif %}
    </form>
</div>
