
{% if multicolor %}
	<svg class="spinner-multicolor" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
	   <circle class="spinner-multicolor-path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
	</svg>
{% else %}
	<div class="spinner {% if inverse %} inverse {% endif %} {% if slider %} spinner-slider {% endif %} {% if medium %} spinner-medium {% endif %} {% if big %} spinner-big {% endif %}">
	    <div class="spinner-circle-wrapper active d-inline-block p-relative full-height full-width">
	        <div class="spinner-layer d-inline-block full-height full-width p-absolute">
	            <div class="spinner-circle-clipper left d-inline-block p-relative">
	                <div class="spinner-circle d-inline-block p-relative"></div>
	            </div><div class="spinner-gap-patch d-inline-block full-height"><div class="spinner-circle d-inline-block p-relative"></div></div><div class="spinner-circle-clipper right d-inline-block p-relative full-height"><div class="spinner-circle d-inline-block p-relative full-height"></div>
	            </div>
	        </div>
	    </div>
	</div>
{% endif %}