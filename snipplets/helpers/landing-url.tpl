{% set _landing = settings.landing_url | trim %}{% if _landing == 'store' %}{{ store.url }}{% elseif _landing %}{{ _landing }}{% else %}https://www.kostumeweb.net/{% endif %}
