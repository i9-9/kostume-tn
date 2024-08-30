{% if store_fb_app_id %}
    <div class="col-xs-12 col-sm-12 col-lg-12 col-md-12 p-relative p-none">
        <a class="btn facebook p-relative full-width" onclick="loginFacebook();" >
            {% include "snipplets/svg/facebook-round.tpl" %}
            {{ 'Facebook login' | translate }}
        </a>
    </div>
    {% if result.facebook and result.invalid %}
    	<div class="alert alert-danger col-xs-12 m-top-half">{{ 'Hubo un problema con el login de Facebook.' | translate }}</div>
	{% endif %}
     <div class="facebook-divider col-xs-12 col-sm-12 col-lg-12 col-md-12 text-center">
        <h4>{{ 'o' | translate }}</h4>
        <hr class="divider">
    </div>
{% endif %}
