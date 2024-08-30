{% set module_show  = settings.module_show %}
{% set module_video = settings.video_embed %}
{% set module_title = settings.module_title %}
{% set module_text = settings.module_text %}
{% set module_button_text = settings.module_button %}
{% set module_url = settings.module_url %}
{% set has_module =  module_show and module_video %}
{% set has_module_text =  module_title or module_text or (module_url and module_button_text) %}
{% if has_module %}
<div class="container" data-store="video-home">
    <div class="row">
        <div class="col-xs-12">
            <div class="module-wrapper container-fluid p-none {% if has_module_text %}module-text-wrapper{% endif %} p-relative">
                <div class="module-video col-sm-8 {% if not has_module_text %}col-sm-offset-2{% endif %} p-left-none p-none-xs">
                    {% include 'snipplets/video-item.tpl' %}
                </div>
                {% if has_module_text %}
                    <div class="col-sm-4 module-text">
                        <div class="module-text-container">
                            {% if module_title %}
                                <h2 class="module-text-title h3-xs">{{ module_title }}</h2>
                            {% endif %}
                            {% if module_text %}
                                <div class="module-text-paragraph">{{ module_text }}</div>
                            {% endif %}
                            {% if module_url and module_button_text %}
                                <a href="{{ module_url | setting_url }}"{% if module_title %} alt="{{ module_title }}" title="{{ module_title }}"{% endif %}>
                                    <div class="btn btn-primary p-left p-right">{{ module_button_text }}</div>
                                </a>
                            {% endif %}
                        </div>
                    </div>
                {% endif %}
            </div>
        </div>
    </div>
</div>
{% endif %}
