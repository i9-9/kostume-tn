<div class="logo-container hidden-xs">
    {% if template == 'home' %}
        <h1 class="mobile-logo-home m-none text-center-xs">
    {% endif %}
        <div id="logo" class="mobile-logo-home logo-img-container {% if not has_logo %}hidden{% endif %}">
            {{ store.logo('large') | img_tag(store.name, {class: 'logo-img img-responsive'}) | a_tag(store.url) }}
        </div>
        <div id="no-logo" {% if has_logo %} class="hidden" {% endif %}>
            <a class="logo-text h1 h3-xs" href="{{ store.url }}">{{ store.name }}</a>
        </div>
    {% if template == 'home' %}
        </h1>
    {% endif %}
</div>
