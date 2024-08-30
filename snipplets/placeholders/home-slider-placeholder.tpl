{# Mobile home slider placeholder: to be hidden after content loaded #}
{% if settings.slider and settings.slider is not empty %}
    <div class="js-home-slider-placeholder mobile-placeholder placeholder-container">
        <div class="placeholder-figures-container">
            <div class="placeholder-left-col pull-left">
                <div class="placeholder-square placeholder-color">
                    <div class="placeholder-icon col-xs-12">{% include "snipplets/svg/panorama.tpl" %}</div>
                </div>
            </div>
            <div class="placeholder-right-col pull-left">
                <div class="row">
                    <div class="col-xs-10 placeholder-line placeholder-color">
                    </div>
                    <div class="col-xs-8 placeholder-line placeholder-color m-top-half">
                    </div>
                    <div class="col-xs-8 placeholder-line placeholder-color m-top-half">
                    </div>
                </div>
            </div>
        </div>
        <div class="placeholder-shine">
        </div>
    </div>
    <div class="js-slider-desktop-placeholder slider-desktop-placeholder">
    </div>
    {% if settings.slider > 1 %}
        <div class="js-home-slider-placeholder slider-pager">
            {% for slide in settings.slider %}
                <span class="slider-pager-link slider-pager-circle d-inline-block {% if loop.first %}active {% endif %}"></span>
            {% endfor %}
        </div>
    {% endif %}
{% endif %}