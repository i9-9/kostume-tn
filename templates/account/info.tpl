<div class="container m-bottom">
    {% snipplet "page-header.tpl" with page_header_title =  "Mi cuenta" | translate %}
    <div class="row m-bottom">
        <form action="" method="post" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
            <div class="form-group">
                <label for="name">{{ 'Nombre' | translate }}</label>
                <input type="text" name="name" id="name" autocorrect="off" autocomplete="name" class="form-control {% if result.errors.name %}input-error{% endif %}" value="{{ result.name | default(customer.name) }}">
            </div>
            {% if result.errors.name %}
                <div class="alert alert-danger-input">{{ 'Necesitamos saber tu nombre para actualizar tu información.' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input autocapitalize="off" autocorrect="off" autocomplete="email"  class="form-control {% if result.errors.email == 'exists' or result.errors.email %}input-error{% endif %}" name="email" value="{{ result.email | default(customer.email) }}">
            </div>
            {% if result.errors.email == 'exists' %}
                <div class="alert alert-danger-input">{{ 'Encontramos otra cuenta que ya usa este email. Intentá usando otro.' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="alert alert-danger-input">{{ 'Necesitamos saber tu email para actualizar tu información.' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                <input type="tel" name="phone" id="phone" class="form-control" value="{{ result.phone | default(customer.phone) }}" autocorrect="off" autocomplete="tel">
            </div>
            <input class="btn btn-secondary col-xs-12 col-sm-12 col-md-7 col-lg-7 pull-right" type="submit" value="{{ 'Guardar cambios' | translate }}">
        </form>
    </div>
</div>