{# Imprime 1 si el producto es Private Sale (para capturar con {% set x %}{% include %}{% endset %}).
   No usa {% set %} en loops. Detecta categoría, tag, " PS" en nombre o -ps- en URL. #}
{% set _ps_cat = product.category.name | default('') | lower %}
{% set _ps_curl = product.category.url | default('') | lower %}
{% set _ps_tags = product.tags | default([]) | join(' ') | lower %}
{% set _ps_name = product.name | default('') | lower %}
{% set _ps_url = product.url | default('') | lower %}
{% if ('private sale' in _ps_cat) or (_ps_cat == 'private') or ('private-sale' in _ps_curl) or ('private sale' in _ps_tags) or ('private-sale' in _ps_tags) or (' ps' in _ps_name) or ('-ps-' in _ps_url) %}1{% endif %}
