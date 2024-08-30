<h4 class="footer-title">NEWSLETTER</h4>
{% if contact and contact.type == 'newsletter' %}
    {% if contact.success %}
        <div id="footer-newsletter-success" class="contact-ok alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
    {% endif %}
{% endif %}
{% set newsletter_contact_error = contact and contact.type == 'newsletter' and not contact.success %}
<form method="post" action="/winnie-pooh" onsubmit="$(this).attr('action', '');" data-store="newsletter-form">
    <div class="row">
            <div class="form-container col-xs-9 col-sm-9 col-md-9 col-lg-9 m-bottom-half" style="padding: 0; ">
            <label class="hidden">{{ "Tu E-mail" | translate }}</label>
            <input type="text" class="form-control form-control-big" onfocus="if (this.value == '{{ "Tu E-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu E-mail" | translate }}';}" value='{{ "Tu E-mail" | translate }}' name="email" aria-label="{{ "Tu E-mail" | translate }}"
            style="margin-top: 5px; background: #171717;">
            <div class="winnie-pooh hidden">
                <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
            </div>
            <input type="hidden" name="name" value="{{ "Sin nombre" | translate }}" />
            <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
            <input type="hidden" name="type" value="newsletter" />
            {% if newsletter_contact_error %}
                <div id="footer-newsletter-failed" class="contact-error alert alert-danger m-top-half">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
            {% endif %}
        </div>
        <div class="submit-container col-xs-2 col-sm-2 col-md-2 col-lg-2 p-relative p-none m-half-top-xs m-top-quarter">
            <div class="btn-primary btn-circle">
                {% include "snipplets/svg/arrow-forward.tpl" with {fa_custom_class: "fa-xl p-absolute"} %}
            </div>
            <input type="submit" class="full-width p-absolute" name="contact" value='{{ "Enviar" | translate }}' aria-label='{{ "Enviar" | translate }}'>
        </div>
    </div>
</form>
