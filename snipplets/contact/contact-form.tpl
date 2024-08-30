<div id="contact-form" class="m-bottom">
    {# This happens when a buyer clicks on "Contact" on a product page #}
    {% if product %}
        <div class="product-question m-bottom">
            <label>
                {{ "Consulta por:" | translate }} {{ product.name | a_tag(product.url) }}
            </label>
            <div class="product-question-image">
                <img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.featured_image.alt }}">
            </div>
        </div>
    {% endif %}
    {% if contact %}
        {% if contact.success %}
            {% if contact.type == 'order_cancellation' %}
                <div class="alert alert-success">
                    {{ "¡Tu pedido de cancelación fue enviado!" | translate }} 
                    <br>
                    {{ "Vamos a ponernos en contacto con vos apenas veamos tu mensaje." | translate }}
                    <br> 
                    <strong>{{ "Tu código de trámite es" | translate }} #{{ last_order_id }}</strong>
                </div>
            {% else %}
                <div class="alert alert-success">{{ "¡Gracias por contactarnos! Vamos a responderte apenas veamos tu mensaje." | translate }}</div>
            {% endif %}
        {% else %}
            <div class="alert alert-danger">{{ "Necesitamos tu nombre y un email para poder responderte." | translate }}</div>
        {% endif %}
    {% endif %}
    {#  This shady winnie-pooh submit URL is a honey-pot strategy to avoid spam :)  #}

    {% set contact_error =  contact and contact.type == 'contact' and not contact.success %}
    <form  action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');" data-store="contact-form">
        <input type="hidden" value="{{ product.id }}" name="product">
        {% if is_order_cancellation %}
            <input type="hidden" name="type" value="order_cancellation" />
        {% else %}
            <input type="hidden" name="type" value="contact" />
        {% endif %}
        <div class="form-group">
            <input type="text" autocorrect="off" autocomplete="name" id="name" class="form-control {% if contact_error %}input-error{% endif %}" name="name"  onfocus="if (this.value == '{{ "Nombre" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Nombre" | translate }}';}" value='{{ "Nombre" | translate }}'>
            <label for="name">{{ "Nombre" | translate }}</label>
        </div>
        <div class="form-group">
            <input type="email" id="email" autocapitalize="off" autocorrect="off" autocomplete="email" class="form-control {% if contact_error %}input-error{% endif %}"  onfocus="if (this.value == '{{ "Email" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Email" | translate }}';}" value='{{ "Email" | translate }}' name="email">
            <label for="email">{{ "Email" | translate }}</label>
        </div>
        <div class="form-group" style="display:none;">
            <input id="winnie-pooh" type="text" class="form-control" name="winnie-pooh">
            <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
        </div>
        {% if not is_order_cancellation %}
            <div class="form-group">
                <input id="phone" type="tel" autocorrect="off" autocomplete="tel" class="form-control"  onfocus="if (this.value == '{{ "Teléfono" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Teléfono" | translate }}';}" value='{{ "Teléfono" | translate }}' name="phone">
                <label for="phone">
                    {{ "Teléfono" | translate }}
                    <span class="mini-text">({{ "Opcional" | translate }})</span>
                </label>
            </div> 
            <div class="form-group">
                <textarea id="message" name="message" class="form-control" cols="20" rows="5"></textarea>
                <label for="message">
                    {{ "Mensaje" | translate }}
                    <span class="mini-text">({{ "Opcional" | translate }})</span>
                </label>
            </div>
        {% endif %}
        <div class="row">
            <div class="container-fluid">
                <input type="submit" class="btn btn-secondary col-xs-12 col-sm-12 col-md-5 col-lg-5 pull-right" value="{{ 'Enviar' | translate }}" name="contact">
            </div>
        </div>
    </form>
</div>
