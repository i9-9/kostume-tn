{% for item in navigation %}
	{% set skip_duplicate = parent_item and (item.name == ('VER ' ~ parent_item.name) or item.name == ('Ver ' ~ parent_item.name)) %}
	{% if not skip_duplicate %}
		{% if item.subitems %}
			{% set only_ver_child = item.subitems|length == 1 and (item.subitems[0].name == ('VER ' ~ item.name) or item.subitems[0].name == ('Ver ' ~ item.name)) %}
			{% if only_ver_child %}
				<li class="desktop-nav-item">
					<a href="{{ item.url }}" class="desktop-nav-link" {% if item.url | is_external %}target="_blank"{% endif %}>
						{{ item.name }}
					</a>
				</li>
			{% else %}
			    <li class="desktop-nav-item {{ item.current ? 'selected' : '' }}">
					 <a href="{{ item.url }}" class="desktop-nav-link with-subitems" {% if item.url | is_external %}target="_blank"{% endif %} style="font-weight: bold; font-size: 12px;">
					    {{ item.name }}
					 </a>
					<ul class="desktop-nav-list">
						{% snipplet "navigation/navigation-subitems.tpl" with navigation = item.subitems, parent_item = item %}
					</ul>
				</li>
			{% endif %}
		{% else %}
			 <li class="desktop-nav-item {{ item.current ? 'selected' : '' }}">
				<a href="{{ item.url | setting_url }}" {% if item.url | is_external %}target="_blank"{% endif %} class="desktop-nav-link">
					{{ item.name }}
				</a>
			</li>
		{% endif %}
	{% endif %}
{% endfor %}
