{% for item in navigation %}
	{% if item.subitems %}
		{% set only_ver_child = item.subitems|length == 1 and (item.subitems[0].name == ('VER ' ~ item.name) or item.subitems[0].name == ('Ver ' ~ item.name)) %}
		{% if only_ver_child %}
		    <li class="desktop-nav-item {{ item.current ? 'selected' : '' }} {{ loop.first ? 'first' : '' }}">
				<a href="{{ item.url }}" class="desktop-nav-link with-subitems" {% if item.url | is_external %}target="_blank"{% endif %} style="font-weight: bold; font-size: 12px;">
				    {{ item.name }}
				</a>
			</li>
		{% else %}
		    <li class="desktop-nav-item {{ item.current ? 'selected' : '' }} {{ loop.first ? 'first' : '' }}">
				 <a href="{{ item.url }}" class="desktop-nav-link with-subitems" {% if item.url | is_external %}target="_blank"{% endif %} style="font-weight: bold; font-size: 12px;">
				    {{ item.name }}
				 </a>
				<ul class="desktop-nav-list">
					{% if item.name in ['Product','Productos','Produtos'] %}
						<li class="desktop-nav-item">
					        <a href="{{ store.products_url }}" class="desktop-nav-link">
					            <span>{{ 'Todos los productos' | translate }}</span>
					        </a>
		     			</li>
					{% endif %}
					{% snipplet "navigation/navigation-subitems.tpl" with navigation = item.subitems, parent_item = item %}
				</ul>
			</li>
		{% endif %}
	{% else %}
		 <li class="desktop-nav-item {{ item.current ? 'selected' : '' }} {{ loop.first ? 'first' : '' }}">
			<a href="{{ item.url | setting_url }}" {% if item.url | is_external %}target="_blank"{% endif %} class="desktop-nav-link">
				{{ item.name }}
			</a>
		</li>
	{% endif %}
{% endfor %}
