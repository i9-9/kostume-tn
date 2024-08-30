<div class="container">
    {% snipplet "page-header.tpl" with page_header_title = (customer.password ? 'Cambiar Contraseña' : 'Activar cuenta') | translate  , hide_breadcrumbs = true %}
    <div class="row">
        <form action="" method="post" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
            <div class="form-group">
                <label for="password">{{ 'Contraseña' | translate }}</label>
                <input type="password" name="password" id="password" class="form-control {% if failure %}input-error{% endif %}" autocomplete="off">
            </div>
            <div class="form-group">
                <label for="password_confirm">{{ 'Confirmar Contraseña' | translate }}</label>
                <input type="password" name="password_confirm" id="password_confirm" class="form-control {% if failure %}input-error{% endif %}" autocomplete="off">
            </div>
            {% if failure %}
                <div class="alert alert-danger"><div class="arrow arrow-up arrow-centered"></div><p>{{ 'Las contraseñas que escribiste no coinciden. Chequeá que sean iguales entre sí.' | translate }}</p></div>
            {% endif %}
            <input class="btn btn-secondary col-xs-12 col-sm-12 col-md-7 col-lg-7 pull-right" type="submit" value="{{ (customer.password ? 'Cambiar Contraseña' : 'Activar cuenta')  | translate }}">
        </form>
    </div>
</div>
