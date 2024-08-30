
<div class="newsletter-footer container-fluid">
    {% snipplet "newsletter.tpl" %}
</div>
{# Single snipplet that work as credit cards example #}

<footer class="footer">
    {# Example Footer: social networks, newsletter, payment and shipping Logos, contact information and seals #}
    <div id="footer-common" class="container p-top-half">
        <div class="container p-top-half">
            <div class="row">
                {% if store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
                    <div class="footer-social col-xs-12 col-sm-2 col-md-2 col-lg-2 m-bottom">
                        <div class="social-networks-container" class="m-bottom">
                            <h4 class="footer-title">{{ "Redes Sociales" | translate }}</h4>
                            <div class="d-flex">
                            {% for sn in ['instagram', 'facebook', 'youtube', 'tiktok', 'twitter', 'pinterest'] %}
                                {% set sn_url = attribute(store,sn) %}
                                {% if sn_url %}
                                    <a href="{{ sn_url }}" target="_blank" class="btn-circle btn-footer m-right-quarter m-bottom-quarter">
                                        {% include "snipplets/svg/" ~ sn ~ ".tpl" with {fa_custom_class: "svg-main-color fa-md"} %}
                                    </a>
                                {% endif %}
                            {% endfor %}
                            </div>
                        </div>
                    </div>
                {% endif %}
                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <div class="m-bottom">
                        <h4 class="footer-title">{{ "Ejemplos de medios de pago" | translate }}</h4>
                         {% if store.country == 'BR' %}
                            {% for payment_method in [ 'visa','mastercard', 'amex', 'diners', 'pagseguro', 'moip' ] %}
                              {{ payment_method | payment_new_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                            {% endfor %}
                        {% else %}
                            {% for payment_method in [ 'visa','mastercard', 'amex', 'diners', 'mercadopago' ] %}
                              {{ payment_method | payment_new_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                            {% endfor %}
                            {% if store.country == 'AR' %}
                                {% for payment_method in [ 'ar/pagofacil','ar/rapipago', 'ar/tarjeta-naranja' ] %}
                                  {{ payment_method | payment_new_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                                {% endfor %}                                
                            {% endif %}
                        {% endif %}
                    </div>
                    <div class="footer-shipping m-bottom">
                        <h4 class="footer-title">{{ "Ejemplos de formas de envío" | translate }}</h4>
                         {% if store.country == 'BR' %}
                            {% for shipping_method in [ 'br/correios' ] %}
                              {{ shipping_method | shipping_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                            {% endfor %}
                        {% else %}
                            {% for shipping_method in [ 'fedex','ups' ] %}
                              {{ shipping_method | shipping_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                            {% endfor %}
                            {% if store.country == 'AR' %}
                                {{ "ar/oca" | shipping_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                            {% endif %}
                        {% endif %}
                    </div>
                </div>
                {#  **** Seals *** #}
                {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
                    <div class="seals-container col-xs-12 col-sm-2 col-md-2 col-lg-2 m-bottom">
                        <h4 class="footer-title">{{ "Seguridad y Certificaciones" | translate }}</h4>
                        {% if store.afip %}
                            <div class="seal-afip">
                                {{ store.afip | raw }}
                            </div>
                        {% endif %}
                        {% if ebit %}
                            <div class="seal-ebit">
                                {{ ebit }}
                            </div>
                        {% endif %}
                        {% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
                            <div class="custom-seals-container row">
                                {% if "seal_img.jpg" | has_custom_image %}
                                    <div class="custom-seal custom-seal-img container-fluid m-bottom-half">
                                        {% if settings.seal_url != '' %}
                                            <a href="{{ settings.seal_url | setting_url }}" target="_blank">
                                                {{ "seal_img.jpg" | static_url | img_tag(" ",{class: 'col-xs-4 col-sm-12 col-md-8 col-lg-8 p-none'})}}
                                            </a>
                                        {% else %}
                                            {{ "seal_img.jpg" | static_url | img_tag(" ",{class: 'col-xs-4 col-sm-12 col-md-8 col-lg-8 p-none'})}}
                                        {% endif %}
                                    </div>
                                {% endif %}
                                {% if settings.custom_seal_code %}
                                    <div class="custom-seal custom-seal-code container-fluid m-top-half">
                                        {{ settings.custom_seal_code | raw }}
                                    </div>
                                {% endif %}
                            </div>
                        {% endif %}
                    </div>
                {% endif %}
            </div>
        </div>
    </div>
    {#  Legal Footer: contains store´s legal information #}
    <div class="footer-legal font-small-extra">
        <div class="container p-top-half p-bottom-half">
            <div class="row">
                <div class="powered-by col-xs-12 col-sm-6 col-md-6 col-lg-6 text-left text-center-xs m-top-half m-bottom-half">
                    {#
                    La leyenda que aparece debajo de esta linea de código debe mantenerse
                    con las mismas palabras y con su apropiado link a Tienda Nube;
                    como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
                    Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
                    tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
                    Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
                    palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
                    http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
                    e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
                    manter visivél e com um link funcionando.
                    #}
                    {{ powered_by_link }}
                </div>
                <div class="copyright-container col-xs-12 col-sm-6 col-md-6 col-lg-6 text-right text-center-xs m-top-half m-bottom-half">
                    {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
                </div>
            </div>
        </div>
    </div>
</footer>
