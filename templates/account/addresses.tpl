<div class="container">
    {% snipplet "page-header.tpl" with page_header_title =  "Mis direcciones" | translate %}
        <div class="row">

        {% for address in customer.addresses %}

            {# User addresses listed - Main Address #}

            {% if loop.first %}
                <div class="col-xs-12 col-sm-4">
                    <h4 class="m-top-double m-bottom weight-strong">{{ 'Principal' | translate }}</h4>

                    {# User addresses listed - Other Addresses #}

            {% elseif loop.index == 2 %}
                <div class="col-xs-12 col-sm-8">
                    <h4 class="m-top-double m-bottom weight-strong">{{ 'Otras direcciones' | translate }}</h4>
            {% endif %}
                    {% if loop.index == 2 %}
                        <div class="row">
                    {% endif %}
                            {% if not loop.first %}
                                <div class="col-sm-6">
                            {% endif %}
                                    <div class="material-card p-all m-bottom">
                                        <p class="font-body">{{ address | format_address }}</p>
                                        {{ 'Editar' | translate | a_tag(store.customer_address_url(address), '', 'btn-link btn-link-primary m-top') }}
                                    </div>
                                    {% if loop.first %}
                                        <div class="full-width-container m-bottom">
                                            <a class="btn btn-primary pull-right" href="{{ store.customer_new_address_url }}"> {{ 'Agregar una nueva dirección' | translate }}</a>
                                        </div>
                                    {% endif %}
                            {% if not loop.first %}
                                </div>
                            {% endif %}
                    {% if loop.last and not loop.first %}
                        </div>
                    {% endif %} 
            {% if loop.first or loop.last == 2 %}
                </div>
            {% endif %}     
        {% endfor %}
    </div>
</div>
