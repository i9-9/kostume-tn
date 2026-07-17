{% for item in navigation %}
	{% set skip_duplicate = parent_item and (item.name == ('VER ' ~ parent_item.name) or item.name == ('Ver ' ~ parent_item.name)) %}
	{% if not skip_duplicate %}
		{% if item.subitems %}
			{% set only_ver_child = item.subitems|length == 1 and (item.subitems[0].name == ('VER ' ~ item.name) or item.subitems[0].name == ('Ver ' ~ item.name)) %}
			{% if only_ver_child %}
				<li>
					<a class="hamburger-panel-link weight-normal" href="{{ item.url }}">{{ item.name }}</a>
				</li>
			{% else %}
				<li class="item-with-subitems p-relative">
					<div class="js-hamburger-panel-toggle-accordion">
						<a class="js-toggle-page-accordion hamburger-panel-link weight-normal">
							<span>{{ item.name }}</span>
						</a>
					</div>
					<ul class="js-pages-accordion list-subitems hamburger-panel-accordion" style="display:none;">
						{% snipplet "navigation/navigation-hamburger-list.tpl" with navigation = item.subitems, parent_item = item %}
					</ul>
				</li>
			{% endif %}
		{% else %}
			 <li>
				<a class="hamburger-panel-link weight-normal" href="{{ item.url }}">
					{{ item.name }}</a>
			 </li>
		{% endif %}
	{% endif %}
{% endfor %}
