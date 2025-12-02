
{% set has_shipping_logos = settings.shipping %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
{% set has_footer_contact_info = store.phone or store.email or store.blog or store.address %}
{% if not (has_footer_contact_info or has_shipping_payment_logos or has_products) %}
    {# This is a snipplet to show the user the payment and send methods the first time they visit the store #}
   {% snipplet "defaults/show_help_footer.tpl" %}
{% else %}
    {% if settings.banner_services %}
        <div class="services-container container-fluid visible-when-content-ready">
            {% include 'snipplets/banners/banner-services/banner-services.tpl' %}
        </div>   
    {% endif %}

    
    <footer class="footer" data-store="footer" style="margin-top: auto; flex-shrink: 0; width: 100%;">
    <div class="container" style="
        background: #171717;
        color: white;
        font-weight: bold;
        padding: 10px 13px 10px 13px;
        margin: 0;
        width: 100%;">
        <div class="row">
            <div class="col-md-6">THIS IS KOSTÜME</div><div class="col-md-6"><span class="pull-right hidden-xs">Original ready-to-wear designed in Buenos Aires. Made in Argentina</span></div>
            </div>
    </div>
        {# Common Footer: contains navigation, social networks, newsletter, payment and shipping Logos, contact information and seals #}
        <div class="container p-top-half visible-when-content-ready col-lg-12" style="margin: 0; padding: 14px; font-size: 10px;">
            <div class="row">
                <div class="footer-nav col-sm-2 col-md-2 col-lg-2 m-bottom">
                    <h4 class="footer-title">CONTACT</h4>
                    <ul class="list-style-none row">
                        {% if store.address %}
                            <li class="m-bottom-half container-fluid">
                                <span class="pull-left">
                                    <a href="mailto:contacto@kostumeweb.net" class="text-wrap">EMAIL</a>
                                </span>
                            </li>
                        {% endif %}
                        {% if store.phone %}
                            <li class="m-bottom-half container-fluid">
                                <span class="pull-left">
                                    <a href="https://wa.me/5491167671108">WHATSAPP</a>
                                </span>
                            </li>
                        {% endif %}
                    </ul>
                </div>
                <div id="footer-store-contact" class="footer-contact m-bottom col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <h4 class="footer-title">INFO</h4>
                    <ul class="list-style-none row">
                        {% if store.address %}
                            <li class="m-bottom-half container-fluid">
                                <span class="pull-left">
                                    <a target="_blank" href=" https://eshop.kostumeweb.net/nosotros/" class="text-wrap">ABOUT US</a>
                                </span>
                            </li>
                        {% endif %}
                        {% if store.phone %}
                            <li class="m-bottom-half container-fluid">
                                <span class="pull-left">
                                    <a href="https://eshop.kostumeweb.net/preguntas-frecuentes/">FAQ</a>
                                </span>
                            </li>
                        {% endif %}
                    </ul>
                </div>

                {% if store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
                    <div class="footer-social col-xs-12 col-sm-2 col-md-2 col-lg-2 m-bottom">
                        <div class="social-networks-container" class="m-bottom">
                            <h4 class="footer-title">SOCIAL M.</h4>
                            <ul class="list-style-none row">
                                    <li class="m-bottom-half container-fluid">
                                    <a href="https://www.instagram.com/kostumeba" target="_blank" aria-label="INSTAGRAM">
                                    INSTAGRAM
                                    </a>
                                    </li>
                                    <li class="m-bottom-half container-fluid">
                                    <a href="https://www.tiktok.com/@kostumeba" target="_blank" aria-label="TIKTOK">
                                    TIKTOK
                                    </a>
                                    </li>
                            </ul>
                        </div>
                    </div>
                {% endif %}
                {% if has_shipping_payment_logos %}
                    <div class="col-xs-12 {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}col-sm-2 col-md-2 col-lg-2 {% else %}col-sm-4 col-md-4 col-lg-4{% endif %}">
                        {% if has_payment_logos %}
                            <div class="m-bottom">
                                <h4 class="footer-title">{{ "Medios de pago" | translate }}</h4>
                                {% for payment in settings.payments %}
                                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ payment | payment_new_logo }}" class="lazyload footer-payship-img card-img" alt="{{ payment }}" width="47" height="30"/>
                                {% endfor %}
                            </div>
                        {% endif %}
                        {% if has_shipping_logos %}
                            <div class="footer-shipping m-bottom">
                                <h4 class="footer-title">{{ "Formas de envío" | translate }}</h4>
                                {% for shipping in settings.shipping %}
                                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ shipping | shipping_logo }}" class="lazyload footer-payship-img card-img" alt="{{ shipping }}" width="47" height="30"/>
                                {% endfor %}
                            </div>
                        {% endif %}
                    </div>
                {% endif %}
                {% if store.phone or store.email or store.blog or store.address %}
                    <div id="footer-store-contact" class="footer-contact m-bottom col-xs-12 col-sm-2 col-md-2 col-lg-2">
                        <h4 class="footer-title">STORE</h4>
                        <ul class="list-style-none row">
                            {% if store.address %}
                                <li class="m-bottom-half container-fluid">
                                    <span class="pull-left">
                                        <a target="_blank" href="https://g.page/kostumeba" class="text-wrap">HONDURAS 4771, PALERMO</a>
                                    </span>
                                </li>
                            {% endif %}
                            {% if store.phone %}
                                <li class="m-bottom-half container-fluid">
                                    <span class="pull-left">
                                        <a href="tel:{{ store.phone }}">{{ store.phone }}</a>
                                    </span>
                                </li>
                            {% endif %}
                            {% if store.blog %}
                                <li class="m-bottom-half container-fluid">
                                    <span class="pull-left">
                                        <a target="_blank" href="{{ store.blog }}" class="text-wrap">{{ store.blog }}</a>
                                    </span>
                                </li>
                            {% endif %}
                        </ul>

                    </div>

            <div id="footer-store-contact" class="footer-contact m-bottom col-xs-12 col-sm-4 col-md-4 col-lg-4" style="padding-right: 20px;">
                     {% include 'snipplets/newsletter.tpl' %}
            </div>

                {% endif %}
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
                                        {% if "seal_img.jpg" | has_custom_image %}
                                            {% if settings.seal_url != '' %}
                                                <a href="{{ settings.seal_url | setting_url }}" target="_blank">
                                            {% endif %}
                                                <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ "seal_img.jpg" | static_url }}" class="lazyload js-lazy-loading" alt="{{ 'Sello de' | translate }} {{ store.name }}" />
                                            {% if settings.seal_url != '' %}
                                                </a>
                                            {% endif %}
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
        {#  Legal Footer: contains store´s legal information #}
        <div class="footer-legal font-small-extra">
            <div class="container p-top-half p-bottom-half visible-when-content-ready" style="margin: 0; padding:14px; width: 100%; font-size: 7px;">
                <div class="row">
                    <div class="copyright-container col-sm-8 m-top-half m-bottom-half">© KOSTÜME {{ "now" | date('Y') }}</div>

                    <div class="powered-by col-sm-4 text-right m-top-half m-bottom-half">
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
                        <span class="pull-right">{{ new_powered_by_link }}</span>
                    </div>
                </div>
            </div>
        </div>
    </footer>
{% endif %}
