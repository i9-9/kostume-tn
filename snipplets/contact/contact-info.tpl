{% set has_contact_info = store.phone or store.email or store.blog or store.contact_intro %}
{% if is_order_cancellation %}
    <p class="m-bottom">{{ "Si te arrepentiste, podés pedir la cancelación enviando este formulario." | translate }} </p>
    <a class="btn-link d-inline-block m-bottom" href="{{ status_page_url }}"><strong>{{'Ver detalle de la compra >' | translate}}</strong></a>
    {% if has_contact_info %}
        <h4 class="m-bottom">{{ 'Si tenés problemas con otra compra, contactanos:' | translate }}</h4>
    {% endif %}
{% endif %}
{% if store.contact_intro %}
    <p>{{ store.contact_intro }}</p>
{% endif %}
<ul class="contact-information list-style-none row m-top">
   {% if store.phone %}
        <li class="m-bottom-half container-fluid">
            <span class="svg-icon-primary pull-left m-right-quarter">
                {% include "snipplets/svg/phone.tpl" %}
            </span>
            <h5 class="pull-left d-flex m-top-quarter">
                <a href="tel:{{ store.phone }}" class="text-wrap">{{ store.phone }}</a>
            </h5>
        </li>
    {% endif %}
    {% if store.email %}
        <li class="m-bottom-half text-wrap container-fluid">
            <span class="svg-icon-primary pull-left m-right-quarter">
                {% include "snipplets/svg/email.tpl" %}
            </span>
            <h5 class="pull-left d-flex m-top-quarter">
                {{ store.email | mailto }}
            </h5>
        </li>
    {% endif %}
    {% if store.blog %}
        <li class="m-bottom-half container-fluid">
            <span class="svg-icon-primary pull-left m-right-quarter">
                {% include "snipplets/svg/chat.tpl" %}
            </span>
            <h5 class="pull-left d-flex m-top-quarter">
                <a target="_blank" href="{{ store.blog }}" class="text-wrap">{{ store.blog }}</a>
            </h5>
        </li>
    {% endif %}
    {% if store.address and not is_order_cancellation %}
        <li class="m-bottom-half container-fluid">
            <span class="svg-icon-primary pull-left m-right-quarter">
                {% include "snipplets/svg/location-on.tpl" %}
            </span>
            <h5 class="pull-left d-flex m-top-quarter">
                <a target="_blank" href=" http://maps.google.com/?q={{ store.address }}" class="text-wrap">{{ store.address }}</a>
            </h5>
        </li>
    {% endif %}
</ul>
{% if store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
    <h4 class="m-bottom border-top p-top">{{ "Seguinos" | translate }}</h4>
    <ul class="social-networks list-style-none m-left-none m-top-half">
    {% for sn in ['instagram', 'facebook', 'youtube', 'tiktok', 'twitter', 'pinterest'] %}
        {% set sn_url = attribute(store,sn) %}
        {% if sn_url %}
            <li class="{{ sn }} m-bottom-half d-inline-block m-right-half">
                <a target="_blank" href="{{ sn_url }}" class="btn-circle bg-{{ sn }} pull-left">
                    {% include "snipplets/svg/" ~ sn ~ ".tpl" %}
                </a>
            </li>
        {% endif %}
    {% endfor %}
    </ul>
{% endif %}   
