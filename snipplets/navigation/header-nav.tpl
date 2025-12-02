<div class="nav-main navbar js-main-navbar js-search-container mobile-nav" data-store="head" style="min-height: auto; padding-bottom: 5px; padding-top: 5px;">
    {# Top nav links: account and languages #}

    {# LANGUAGES / LOGIN - REGISTER #}
    
    {#  {% if store.has_accounts or languages | length > 1 %}
        <div class="js-nav-top nav-top container-fluid {% if not settings.ad_bar or not settings.ad_text %}hidden-xs{% endif %}">
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 hidden-xs">
                    <div class="search-lang-wrapper pull-left">
                         {% if languages | length > 1 %}
                            <div class="languages">
                                <ul class="language list-style-none m-bottom-none">
                                    {% for language in languages %}
                                    {% set class = language.active ? "" : "opacity-50" %}
                                        <li class="nav-top-item">
                                            <a href="{{ language.url }}" class="{{class}} m-left-quarter" aria-label="{{ language.name }}"><img class="lazyload" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ language.country | flag_url }}" alt="{{ language.name }}" />
                                            <p class="ladyload">
                                                {% if language.country == 'US' %} 
                                                    WORLDWIDE 
                                                {% elseif language.country == 'AR' %}
                                                    ARGENTINA
                                                {% else %} 
                                                    {{language.country}} 
                                                {%endif%} </p>
                                            </a>
                                        </li>
                                    {% endfor %}
                                </ul>
                            </div>
                        {% endif %}
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 text-center">
                    {% if settings.ad_bar and settings.ad_text %}
                        {% snipplet "navigation/advertising.tpl" %}
                    {% endif %}
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 text-right hidden-xs">
                    <ul class="list-style-none p-none m-none account-links" data-store="account-links">
                        <span class="svg-primary-fill top-head-icon">
                            {% include "snipplets/svg/user.tpl" with {fa_custom_class: "fa-sm svg-background-icon"} %}
                        </span>
                        {% if store.has_accounts %}
                            {% if not customer %}
                                {% if 'mandatory' not in store.customer_accounts %}
                                    <li class="nav-top-item">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, "Crear cuenta" | translate, 'nav-top-link') }}</li>
                                {% endif %}
                                    <li class="nav-top-item">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, "Iniciar sesión" | translate, 'nav-top-link') }}</li>
                            {% else %}
                                {% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %} 
                                <li class="nav-top-item">{{ "¡Hola, {1}!" | t(customer_short_name) | a_tag(store.customer_home_url, "¡Hola, {1}!" | t(customer.name),'nav-top-link weight-strong')}}</li> 
                                <li class="nav-top-item">{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, "Cerrar sesión" | translate, 'nav-top-link') }}</li>
                            {% endif %}
                        {% endif %}
                    </ul>
                </div>
            </div>
        </div>
    {% endif %} #}
    <div class="{% if settings.head_fix %}js-head-fixed {% endif %}navbar-header mobile-nav-first-row full-width" style="
    background: #070707;
    color: white;
    display: flex;
    justify-content: flex-start;
    flex-wrap: wrap;
    min-width: 100%;
    padding: 0;
    align-content: stretch;
    align-items: center;
    flex-direction: row;">
    {# Desktop nav #}
        {#<ul class="js-desktop-nav-links nav navbar-nav desktop-nav hidden-xs col-sm-10 col-md-11 col-lg-11" data-store="navigation">
            {% snipplet "navigation/navigation.tpl" %}
        </ul> #}
        <div class="js-mobile-nav-title-container mobile-btn-hamburger-container visible-xs" style="cursor: pointer;">
            <div class="js-modal-open btn-hamburger pull-left" data-toggle="#nav-hamburger" aria-label="{{ "Menú" | translate }}">
                <div class="nav-icon">
                    <h4 class="text-center" style="margin-top: 4px; font-size:10px;align-self:end;">MENU</h4>
                </div>
            </div>
        </div>

        <div class="logo-container visible-xs" style="padding: 0; text-align: -webkit-center; margin-right: 15%;">
            {% if template == 'home' %}
                <div class="mobile-logo-home m-none text-center-xs">
            {% endif %}
                <div id="logo" class="mobile-logo-home logo-img-container {% if not has_logo %}hidden{% endif %}">
                    <a href="https://kostumeweb.net/">
                        {% include "snipplets/svg/logo.tpl" %}
                    </a>
                </div>
                <div id="no-logo" {% if has_logo %} class="hidden" {% endif %}>
                    <a class="logo-text h1 h3-xs" href="{{ store.url }}">{{ store.name }}</a>
                </div>
            {% if template == 'home' %}
                </div>
            {% endif %}
        </div>


        <div class="col-xs-4 col-sm-3 col-lg-4 hidden-xs" style="padding-left: 15px;">
            {% if template == 'home' %}
                <div 
                    style="
                        margin-bottom: 0px;
                        display: inline-block;">
            {% endif %}
                <div id="logo"  style="padding-top: 10px;">
                    <a href="https://kostumeweb.net">
                        {% include "snipplets/svg/logo.tpl" %}
                    </a>
                </div>
                <div id="no-logo" {% if has_logo %} class="hidden" {% endif %}>
                    <a class="logo-text h1 h3-xs" href="{{ store.url }}">{{ store.name }}</a>
                </div>
            {% if template == 'home' %}
                </div>
            {% endif %}
        </div> 

        <div class="js-hamburger-panel-toggle-accordion col-xs-12 col-sm-3 col-md-3 col-lg-3 text-center hidden-xs" style="padding-top: 5px; padding-left: 92px;">
            <a class="js-toggle-page-accordion hamburger-panel-link p-left-double p-right-double"
            style="text-decoration: none; cursor: pointer; font-size: 12px;">
                <span class="transition-soft text-center">MENU</span>
            </a>
        </div>
        <ul class="js-pages-accordion hamburger-panel-accordion hidden-xs" style="display:none; position: absolute; margin-top: 490px; list-style: none; background: rgba(7, 7, 7, 0.9); width: 100%; padding: 20px 15px;">
            {% snipplet "navigation/navigation.tpl" %}
        </ul>


        {#<div class="navigation-container col-xs-12 col-sm-2 col-md-3 col-lg-5 text-center hidden-xs navbar-header">
            <h3 class="text-center">+</h3>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#alignment-example" aria-expanded="false">
            <ul class="js-desktop-nav-links nav navbar-nav desktop-nav hidden-xs col-sm-10 col-md-12 col-lg-12 navigation-hidden">
                {% snipplet "navigation/navigation.tpl" %}
            </ul> 
        </div>#}

            
        <div class="container-nav-right hidden-xs col-xs-6 col-lg-5">
            <div class="text-right hidden-xs" 
            style="padding-right: 0px;
                padding-left: 0px;">
                <ul class="account-links" data-store="account-links" style="margin-bottom: 0; padding-left: 0;">
                    {% if store.has_accounts %}
                        {% if not customer %}
                            {% if 'mandatory' not in store.customer_accounts %}
                                <li class="nav-top-item">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, "Crear cuenta" | translate, 'nav-top-link') }}</li>
                            {% endif %}
                                <li class="nav-top-item">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, "Iniciar sesión" | translate, 'nav-top-link') }}</li>
                        {% else %}
                            {% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %} 
                            <li class="nav-top-item">{{ "¡Hola, {1}!" | t(customer_short_name) | a_tag(store.customer_home_url, "¡Hola, {1}!" | t(customer.name),'nav-top-link weight-strong')}}</li> 
                            <li class="nav-top-item">{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, "Cerrar sesión" | translate, 'nav-top-link') }}</li>
                        {% endif %}
                    {% endif %}
                </ul>
            </div>

            {# Nav icons #}
            <div class="js-nav-icons nav-icons text-right" 
            style="padding-left: 0px; padding-right: 0; display: inline-block;">
                {% if not store.is_catalog %}
                    {# Cart #}
                    <div class="head-cart d-inline-block {% if settings.tab_menu %}hidden-xs{% endif %}">
                        {% if not store.is_catalog and template != 'cart' %}
                            {% if settings.ajax_cart %}
                                {% snipplet "cart-widget-ajax.tpl" as "cart" %}
                            {% else %}
                                {% snipplet "cart-widget.tpl" as "cart" %}
                            {% endif %}
                        {% endif %}
                    </div>
                {% endif %}

                {# Search #}
                <a id="show-search" class="js-toggle-search toggle-search d-inline-block" href="#" aria-label="{{ "Buscar" | translate }}">
                    <span class="nav-icon ">
                        {% include "snipplets/svg/search.tpl" %}
                    </span>
                </a>  

            </div>

            {% if languages | length > 1 %}
            <div class="languages hidden-xs" style="padding-left: 20px; padding-right: 15px;">
                <div class="row" style="display: flex;
                                        flex-direction: row;
                                        align-items: baseline;">
                <ul class="language list-style-none m-bottom-none text-right" style="font-size: 9px; padding: 1px;">
                        {% for language in languages %}
                        {% set class = language.active ? "" : "opacity-50" %}
                            <li class="flag-item" {% if language.active %} style="font-weight: bold; "{% endif %}>
                                <a href="{{  language.url }}" class="{{class}} m-left-quarter" aria-label="{{ language.name }}">
                                <p class="ladyload">
                                {% if language.country == 'US' %} 
                                    WORLDWIDE 
                                {% elseif language.country == 'AR' %}
                                    ARGENTINA
                                {% else %} 
                                    {{language.country}} 
                                {%endif%} </p>
                                </a>
                            </li>
                        {% endfor %}
                    </ul>
                </div>
            </div>
        {% endif %}
        </div>

        {# Search #}
        <a id="show-search" class="js-toggle-search toggle-search d-inline-block visible-xs" style="display: inline-block;" href="#" aria-label="{{ "Buscar" | translate }}">
            <span class="nav-icon" style="width: 25px; height: 25px; padding-top: 5px;">
                {% include "snipplets/svg/search.tpl" %}
            </span>
        </a>  


        
        <div class="js-search-form-container col-xs-12" style="background: #070707; color: white;">
            <form class="search-bar input-group js-search-form" action="{{ store.search_url }}" method="get" style="display: none; ">
                <input type="search" autocomplete="off" class="form-control search-input js-search-input" name="q" placeholder="{{ 'Buscar' | translate }}" aria-label="{{ 'Buscador' | translate }}" style="color: white; text-transform: uppercase;">
                <span class="input-group-btn">
                    <button type="submit" class="search-submit hidden-xs btn p-right-none" value="{{ "Buscar" | translate }}" aria-label="{{ "Buscar" | translate }}">
                        {% include "snipplets/svg/search.tpl" with {fa_custom_class: "fa-xl svg-maincolor-color 
                        back-arrow p-left-none"} %}
                    </button>
                    <a href="#" style="display:none;" class="js-delete-search">
                        {% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-xl svg-maincolor-color 
                        back-arrow p-left-none"} %}
                    </a>
                </span>
            </form>
        </div>
    </div> 
    {% if settings.tab_menu %}
        <div class="js-mobile-nav-second-row secondary-navbar-mobile mobile-nav-second-row" style="background: #070707;">
            {% snipplet "navigation/navigation-mobile-tabs.tpl" %}
        </div>
    {% endif %}
    {% include 'snipplets/notification.tpl' with {order_notification: true} %}
</div>
{# Desktop nav #}
        

<div class="js-search-suggest search-suggest">
    {# AJAX container for search suggestions #}
</div>

{% if not settings.head_fix and ( not store.is_catalog and template != 'cart' ) %}

{# Fixed desktop title and cart widget #}
<div class="navbar navbar-fixed-top js-desktop-fixed-summary fixed-summary hidden-xs">
    <div class="nav-title col-sm-6 col-md-6 h4 text-wrap">
        {% snipplet "navigation/fixed-page-title.tpl" %}
    </div>
    <div class="col-sm-6 col-md-6 text-right m-top-quarter">
        {% if not store.is_catalog and template != 'cart' %}
            {% if settings.ajax_cart %}
                {% snipplet "cart-widget-ajax.tpl" as "cart" %}
            {% else %}
                {% snipplet "cart-widget.tpl" as "cart" %}
            {% endif %}
        {% endif %}
    </div>
</div>
{% endif %}

{# Categories list for mobile #}
<div class="js-categories-mobile-container" style="display:none;">
    <ul class="modal-xs js-categories-mobile mobile-nav-categories-container">
        <li> 
            <a href="#" class="js-toggle-mobile-categories btn btn-floating pull-right p-relative m-all-half" aria-label="{{ "Cerrar" | translate }}">{% include "snipplets/svg/times.tpl" with {fa_custom_class: "fa-xl"} %}</a>
        </li>
        <li>
            <a class="modal-xs-list-item darker text-uppercase weight-strong"  href="{{ store.products_url }}">
                {{ 'Ver todos los productos' | translate }}
            </a>
        </li>
        {% snipplet "navigation/navigation-mobile-categories.tpl" %}
    </ul>
    {% for category in categories %}
        {% snipplet "navigation/navigation-mobile-categories-panels.tpl" %}
    {% endfor %}
</div>

{# AJAX Cart Panel #}
{% if not store.is_catalog and template != 'cart' and settings.ajax_cart %}
    {% snipplet "cart-panel-ajax.tpl" %}
 {% endif %}


{# Search backdrop #}
<div id="search-backdrop" class="js-search-backdrop js-close-search js-toggle-search backdrop search-backdrop" style="display: none;"></div>

{# Go to top button #}
<a href="#" class="js-scroll-top btn-go-top btn-circle btn-secondary btn-circle-small hidden-xs" style="display:none;" aria-label="{{ "Subir" | translate }}">
   {% include "snipplets/svg/chevron-up.tpl" with {fa_custom_class: "fa-sm"} %}
</a>

{# Show cookie validation message #}

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{# Add notification for order cancellation #}
{% if store.country == 'AR' and template == 'home' and status_page_url %}
    {% include "snipplets/notification.tpl" with {show_order_cancellation: true} %}
{% endif %}

{% include 'snipplets/notification.tpl' with {add_to_cart: true} %}
