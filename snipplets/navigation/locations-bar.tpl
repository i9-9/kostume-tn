{% if languages | length > 1 %}
<div class="js-locations-bar locations-bar">
    <div class="locations-bar-inner">
        <ul class="language locations-bar-list list-style-none m-none p-none">
            {% for language in languages %}
            {% set class = language.active ? "" : "opacity-50" %}
                <li class="flag-item"{% if language.active %} style="font-weight: bold;"{% endif %}>
                    <a href="{{ language.url }}" class="{{ class }} locations-bar-link" aria-label="{{ language.name }}">
                        {% if language.country == 'AR' %}
                            ARGENTINA
                        {% else %}
                            {{ language.country }}
                        {% endif %}
                    </a>
                </li>
            {% endfor %}
        </ul>
    </div>
</div>
{% endif %}
