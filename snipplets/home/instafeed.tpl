{% set theme_version = settings.version_theme %}
{% if settings.show_instafeed and store.instagram %}
    <div class="instafeed-module text-center" data-store="instagram-feed">
        <div class="container{% if theme_version == 'full' %}-fluid{% endif %}">
            <div class="row instafeed-row">
                {% set instuser = store.instagram|split('/')|last %}
                <div class="js-ig-user-container col-xs-12 instafeed-fallback instafeed-item instafeed-user">
                    <div class="instafeed-title">
                        <h4 class="js-ig-success" style="display: none;">
                            <a target="_blank" href="{{ store.instagram }}" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                                {% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "d-inline-block fa-2x m-bottom-half m-none-xs"} %}
                                <span class="hidden-xs">@{{ instuser }}</span>
                            </a>
                        </h4>

                        {# Instagram fallback info #}
                        
                        <div class="js-ig-fallback p-all">
                            <a target="_blank" href="{{ store.instagram }}" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                                {% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "d-inline-block fa-2x"} %}
                                <h2 class="h3-xs m-top-quarter m-bottom-quarter">{{ instuser }}</h2>
                                <div class="text-uppercase">{{ 'Seguinos en Instagram' | translate }}</div>
                            </a>
                        </div>
                    </div>
                </div>
                {% if store.hasInstagramToken() %}
                    <div id="instagram-feed" class="js-ig-success p-none"
                        data-ig-feed
                        data-ig-items-count="5"
                        data-ig-item-class="instafeed-item col-md-2 col-xs-4 m-bottom-half m-bottom-quarter-xs"
                        data-ig-link-class="instafeed-link"
                        data-ig-image-class="instafeed-img img-responsive fade-in"
                        data-ig-aria-label="{{ 'Publicación de Instagram de' | translate }} {{ store.name }}"
                        style="display: none;">
                    </div>
                {% endif %}
            </div>
        </div>
    </div>
{% endif %}