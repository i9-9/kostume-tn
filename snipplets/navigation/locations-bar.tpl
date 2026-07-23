{% if languages | length > 1 %}
{% set country_en = {
    'AE': 'United Arab Emirates',
    'AR': 'Argentina',
    'AU': 'Australia',
    'BE': 'Belgium',
    'BR': 'Brazil',
    'CL': 'Chile',
    'DE': 'Germany',
    'DK': 'Denmark',
    'ES': 'Spain',
    'FR': 'France',
    'GB': 'United Kingdom',
    'IT': 'Italy',
    'JP': 'Japan',
    'KR': 'South Korea',
    'MX': 'Mexico',
    'NL': 'Netherlands',
    'PT': 'Portugal',
    'SE': 'Sweden',
    'US': 'United States',
    'UY': 'Uruguay'
} %}
<div class="js-locations-bar locations-bar">
    <div class="locations-bar-inner">
        <ul class="language locations-bar-list list-style-none m-none p-none">
            {% for language in languages %}
            {% set class = language.active ? "" : "opacity-50" %}
            {% set label_en = attribute(country_en, language.country) | default(language.country) %}
                <li class="flag-item"{% if language.active %} style="font-weight: bold;"{% endif %}>
                    <a href="{{ language.url }}" class="{{ class }} locations-bar-link" aria-label="{{ label_en }}">
                        {% if language.active %}
                            {{ label_en }}
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
