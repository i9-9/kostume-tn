<div class="nav-top-item">
   	{% if settings.ad_bar and settings.ad_text %}
   	    {% if settings.ad_url %}
	        <a class="nav-top-link" href="{{ settings.ad_url | setting_url }}">
	    {% else %} 
	    	<span class="nav-top-advertising">
		{% endif %}  
        	{% if settings.ad_text %}
        		{{ settings.ad_text }}
        	{% endif %} 
		{% if settings.ad_url %}
	        </a>
        {% else %} 
	    	</span>
		{% endif %} 
    {% endif %}       	
</div>
        