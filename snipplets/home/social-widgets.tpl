{% set has_facebook_widget = settings.show_footer_fb_like_box and store.facebook %}
<div id="facebook-twitter-widget" class="container m-bottom border-top">
    <div class="row">
        {#  **** Facebook ****  #}
        {% if has_facebook_widget %}
        <div class="col-xs-12 col-sm-12 {% if settings.twitter_widget %}col-md-6 col-lg-6{% else %}col-md-12 col-lg-12{% endif %}">
            <div class="social-title text-center">
                <h4>{{"Seguinos en Facebook" | translate}}</h3>
            </div>
            <div class="fb-page">
                <div class="fb-page-head p-all-half">
                    <div class="d-flex">
                        <div class="fb-page-img-container m-right-half text-center">
                            {% if has_logo %}
                                <img src="{{ 'images/empty-placeholder.png' | static_url }}" class="fb-page-img lazyload" data-src="{{ store.logo('thumb')}}"/>
                            {% else %}
                                {% include "snipplets/svg/facebook.tpl" with {fa_custom_class: " fa-2x m-top-quarter fb-page-icon"} %}
                            {% endif %}
                        </div>
                        <div>
                            <div class="h4 m-top-none">{{ store.name }}</div>
                            <div class="m-top-half">
                                <a href="{{ store.facebook }}" target="_blank" class="fb-like weight-strong">
                                    {% include "snipplets/svg/thumbs-up.tpl" with {fa_custom_class: "m-right-quarter fa-xs"} %}
                                    {{ 'Me gusta' | translate }}
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="fb-page-footer p-all-half">
                    <div class="fb-page-box">
                        <a href="{{ store.facebook }}" target="_blank" class="fb-page-link">
                            <span class="weight-strong opacity-80">{{ 'Visitá nuestra página' | translate }}</span>
                             {% include "snipplets/svg/facebook-round.tpl" with {fa_custom_class: "m-left-quarter fa-sm"} %}
                        </a>
                    </div>
                </div>
            </div>
        </div>
        {% endif %}
        {% if settings.twitter_widget %}
            <div class="col-xs-12 col-sm-12 {% if has_facebook_widget %}col-md-6 col-lg-6{% else %}col-md-12 col-lg-12{% endif %}">
                 <div class="social-title text-center">
                    <h4>{{"Seguinos en Twitter" | translate}}</h3>
                </div>
                <div class="twitter-widget text-center">
                    {{ settings.twitter_widget | raw }}
                </div>
            </div>
        {% endif %}
    </div>
</div>