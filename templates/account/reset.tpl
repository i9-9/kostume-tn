<div class="container m-bottom">
    {% snipplet "page-header.tpl" with page_header_title =  "Cambiar Contraseña" | translate  %}
    <div class="row m-top">
        <p class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">{{ 'Vamos a enviarte un email para que puedas cambiar tu contraseña.' | translate }}</p>
        <form action="" method="post" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
            {% if success %}
                <div class="alert alert-success">{{ '¡Listo! Te enviamos un email a {1}' | translate(email) }}</div>
            {% endif %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input autocorrect="off" autocapitalize="off" name="email" id="email" class="form-control {% if failure %}input-error{% endif %}" value="{{ email }}">
            </div>
            {% if failure %}
                <div class="alert alert-danger-input">{{ 'No encontramos ninguna cuenta registrada con este email. Intentalo nuevamente chequeando que esté bien escrito.' | translate }}</div>
            {% endif %}
            <input class="btn btn-secondary col-xs-12 col-sm-12 col-md-7 pull-right" type="submit" value="{{ 'Enviar email' | translate }}">
        </form>
    </div>
</div>
