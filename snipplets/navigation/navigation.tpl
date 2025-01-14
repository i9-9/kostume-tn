{% for item in navigation %}
	{% if item.subitems %}
	    <li class="desktop-nav-item {{ item.current ? 'selected' : '' }} {{ loop.first ? 'first' : '' }} {{ loop.index == 7 ? 'on-sale' : '' }} {{ loop.index == 4 ? 'col-md-3' : '' }} {{ loop.index == 5 ? 'col-md-3' : '' }} {{ loop.index == 6 ? '' : '' }}" style="{{ loop.index == 6 ? '' : '' }} {{ loop.index == 7 ? '' : '' }}">
			 <a href="{{ item.url }}" class="desktop-nav-link with-subitems "  {% if item.url | is_external %}target="_blank"{% endif %} style="font-weight: bold; font-size: 12px; {{ loop.index == 6 ? '' : '' }} {{ loop.index == 7 ? '' : '' }}">
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
				{% snipplet "navigation/navigation.tpl" with navigation = item.subitems %}
			</ul>
		</li>
	{% else %}
		 <li class="desktop-nav-item {{ item.current ? 'selected' : '' }} {{ loop.first ? 'first' : '' }}">
			<a href="{{ item.url | setting_url }}" {% if item.url | is_external %}target="_blank"{% endif %} class="desktop-nav-link">
				{{ item.name }}
			</a>
		</li>
	{% endif %}
{% endfor %}
