{% for item in navigation %}
	{% if item.subitems %}
		<li class="item-with-subitems p-relative">
			<div class="js-hamburger-panel-toggle-accordion">
				<a class="js-toggle-page-accordion hamburger-panel-link p-right-double weight-normal">
					<span class="m-right-quarter">{{ item.name }}</span>
				</a>
			</div>
			<ul class="js-pages-accordion list-subitems hamburger-panel-accordion" style="display:none;">
				{% if item.isCategory  %}
					<li class="hamburger-panel-item item-with-subitems">
						<a class="hamburger-panel-link" href="{{ item.url }}">
							<strong>
								{% if item.isRootCategory %}
									{{ 'Ver todos los productos' | translate }}
								{% else %}
									{{ 'Ver todo en' | translate }} {{ item.name }}
								{% endif %}
							</strong>
						</a>
					</li>
				{% endif %}
				{% snipplet "navigation/navigation-hamburger-list.tpl" with navigation = item.subitems %}
			</ul>
		</li>
	{% else %}
		 <li>
			<a class="hamburger-panel-link weight-normal" href="{{ item.url }}">
				{{ item.name }}</a>
		 </li>
	{% endif %}
{% endfor %}