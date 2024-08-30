{% for item in menus[settings.footer_menu] %}
	<li class="d-block m-bottom-half-xs">
        <a class="footer-nav-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
	</li>
{% endfor %}