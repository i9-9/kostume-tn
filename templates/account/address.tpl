<div class="container">
    {% snipplet "page-header.tpl" with page_header_title =  "Dirección" | translate %}
    <div class="row m-bottom">
        <form action="" method="post" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
            <div class="form-group">
                <label for="name">{{ 'Nombre (alias)' | translate }}</label>
                <input type="text" name="name" id="name" class="form-control {% if result.errors.name %}input-error{% endif %}" value="{{ result.name | default(address.name) }}" placeholder="{{ 'Trabajo' | translate }}">
            </div>
            {% if result.errors.name %}
                <div class="alert alert-danger-input">{{ 'Necesitamos saber tu nombre para actualizar tu información.' | translate }}</div>
            {% endif %}

            {% if current_language.country == 'BR' %}
                {% set address_placeholder = 'Av. Pueyrredón' | translate %}
            {% else %}
                {% set address_placeholder = 'Av. Pueyrredón 1234, CABA' | translate %}
            {% endif %}

            <div class="form-group">
                <label for="address">{{ 'Dirección' | translate }}</label>
                <input type="text" name="address" id="address" class="form-control {% if result.errors.address %}input-error{% endif %}" value="{{ result.address | default(address.address) }}" placeholder="{{ address_placeholder | translate }}">
            </div>
             {% if result.errors.address %}
                <div class="alert alert-danger-input">{{ 'Necesitamos saber tu dirección para actualizar tu información.' | translate }}</div>
            {% endif %}
            {% if current_language.country == 'BR' %}
                <div class="form-group">
                    <label for="number">{{ 'Número' | translate }}</label>
                    <input type="text" name="number" id="number" class="form-control {% if result.errors.number %}input-error{% endif %}" value="{{ result.number | default(address.number) }}" placeholder="{{ '1234' | translate }}">
                </div>
                {% if result.errors.number %}
                    <div class="alert alert-danger-input">{{ 'Necesitamos saber tu número para actualizar tu información.' | translate }}</div>
                {% endif %}
                <div class="form-group">
                    <label for="floor">{{ 'Piso' | translate }}</label>
                    <input type="text" name="floor" id="floor" class="form-control {% if result.errors.floor %}input-error{% endif %}" value="{{ result.floor | default(address.floor) }}">
                </div>
                {% if result.errors.floor %}
                    <div class="alert alert-danger-input">{{ 'Necesitamos saber tu piso para actualizar tu información.' | translate }}</div>
                {% endif %}
                <div class="form-group">
                    <label for="locality">{{ 'Localidad' | translate }}</label>
                    <input type="text" name="locality" id="locality" class="form-control {% if result.errors.locality %}input-error{% endif %}" value="{{ result.locality | default(address.locality) }}" placeholder="{{ 'CABA' | translate }}">
                </div>
                {% if result.errors.locality %}
                    <div class="alert alert-danger-input">{{ 'Necesitamos saber tu localidad para actualizar tu información.' | translate }}</p></div>
                {% endif %}
            {% endif %}
            <div class="form-group">
                <label for="zipcode">{{ 'Código Postal' | translate }}</label>
                <input type="text" name="zipcode" id="zipcode" class="form-control {% if result.errors.zipcode %}input-error{% endif %}" value="{{ result.zipcode | default(address.zipcode) }}" placeholder="{{ '1429' | translate }}">
            </div>
            {% if result.errors.zipcode %}
                <div class="alert alert-danger-input">{{ 'Necesitamos saber tu código postal para actualizar tu información.' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="city">{{ 'Ciudad' | translate }}</label>
                <input type="text" name="city" id="city" class="form-control {% if result.errors.city %}input-error{% endif %}" value="{{ result.city | default(address.city) }}" placeholder="{{ 'CABA' | translate }}">
            </div>
            {% if result.errors.city %}
                <div class="alert alert-danger-input">{{ 'Necesitamos saber tu ciudad para actualizar tu información.' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="province">{{ 'Provincia' | translate }}</label>
                <input type="text" name="province" id="province" class="form-control {% if result.errors.province %}input-error{% endif %}" value="{{ result.province | default(address.province) }}" placeholder="{{ 'CABA' | translate }}">
            </div>
            {% if result.errors.province %}
                <div class="alert alert-danger-input">{{ 'Necesitamos saber tu provincia para actualizar tu información.' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="country">{{ 'País' | translate }}</label>
                <select name="country" id="country" class="form-control {% if result.errors.country %}input-error{% endif %}">{{ country_options }}</select>
            </div>
            {% if result.errors.country %}
                <div class="alert alert-danger-input">{{ 'Necesitamos saber tu país para actualizar tu información.' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="phone">{{ 'Teléfono' | translate }}</label>
                <input type="text" name="phone" id="phone" class="form-control {% if result.errors.phone %}input-error{% endif %}" value="{{ result.phone | default(address.phone) }}" placeholder="{{ '1123445567' | translate }}">
            </div>
            {% if result.errors.phone %}
                <div class="alert alert-danger-input">{{ 'Necesitamos saber tu teléfono para actualizar tu información.' | translate }}</div>
            {% endif %}
            <input class="btn btn-secondary col-xs-12 col-sm-12 col-md-7 col-lg-7 pull-right" type="submit" value="{{ 'Guardar cambios' | translate }}">
        </form>
    </div>
</div>
