<div class="js-desktop-head-container {% if settings.head_fix %}js-head-fixed{% endif %} head-container transition-soft">
    <div class="container-fluid">
        <header>    
            <div class="row search-logo-cart-container">        
                <div class="col-xs-3">
                    <div class="js-toggle-hamburger-panel btn-hamburger text-center visible-phone pull-left">
                        <div class="mobile-nav-first-row-icon svg-icon-text">
                            {% include "snipplets/svg/hamburger.tpl" %}
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 logo-container">
                    {% if template == 'home' %}
                        <h1 class="mobile-logo-home text-center-xs">
                    {% endif %}
                        <div id="logo" class="mobile-logo-home logo-img-container {% if not has_logo %}hidden{% endif %}">
                            {{ store.logo('large') | img_tag(store.name, {class: 'logo-img  transition-soft-slow'}) | a_tag(store.url) }}
                        </div>
                        <div id="no-logo" {% if has_logo %} class="hidden" {% endif %}>
                            <a class="logo-text h1" href="{{ store.url }}">{{ store.name }}</a>
                        </div>
                    {% if template == 'home' %}
                        </h1>
                    {% endif %}
                </div>                
                <div class="mobile-cart col-xs-3 text-right">
                    <div class="visible-phone">
                    {% if not settings.search_fix and not settings.tab_menu %}    
                        <div class="js-toggle-mobile-search js-toggle-mobile-search-open mobile-search-btn text-center d-inline-block h5">
                            <span class="nav-icon ">
                                {% include "snipplets/svg/search.tpl" %}
                            </span>
                        </div>
                    {% endif %}
                    {% if not store.is_catalog %}
                        {# Cart #}
                            {% if not store.is_catalog and template != 'cart' %}
                                {% if settings.ajax_cart %}
                                    {% snipplet "cart-widget-ajax.tpl" as "cart" %}
                                {% else %}
                                    {% snipplet "cart-widget.tpl" as "cart" %}
                                {% endif %}
                            {% endif %}
                    {% endif %}
                    </div>
                </div>
            </div>    
            <ul class="js-desktop-nav desktop-nav hidden-phone font-small">
                {% snipplet "navigation/navigation.tpl" %}
            </ul>
        </header>
    </div>
</div>