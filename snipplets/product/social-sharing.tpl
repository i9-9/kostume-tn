<div class="product-social-sharing {% if mobile %} visible-xs {% else %} hidden-xs {% endif %}">
    {# Whatsapp button #}
    <a class="js-product-share btn-circle product-btn-share bg-whatsapp product-share-button visible-xs d-flex-xs" data-network="facebook" data-network="whatsapp" target="_blank" href="whatsapp://send?text={{ product.social_url }}" title="{{ "Compartir en WhatsApp" | translate }}" aria-label="{{ "Compartir en WhatsApp" | translate }}">
        {% include "snipplets/svg/whatsapp.tpl" with {fa_custom_class: "fa-md btn-social-icon"} %}
    </a>
    {# Facebook button #}
    <a class="js-product-share btn-circle product-btn-share bg-facebook product-share-button" data-network="facebook" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}" title="{{ "Compartir en Facebook" | translate }}" aria-label="{{ "Compartir en Facebook" | translate }}">
        {% include "snipplets/svg/facebook.tpl" with {fa_custom_class: "fa-md"} %}
    </a>
    {# Twitter button #}
    <a class="js-product-share btn-circle product-btn-share bg-twitter product-share-button" data-network="twitter" target="_blank" href="https://twitter.com/share?url={{ product.social_url }}" title="{{ "Compartir en Twitter" | translate }}" aria-label="{{ "Compartir en Twitter" | translate }}">
        {% include "snipplets/svg/twitter.tpl" with {fa_custom_class: "fa-md"} %}
    </a>
    {# Pinterest button that triggers real pin button hidden with CSS #}
    <a class="js-product-share js-pineterest-share btn-circle product-btn-share bg-pinterest" target="_blank" title="{{ "Compartir en Pinterest" | translate }}" aria-label="{{ "Compartir en Pinterest" | translate }}">
         {% include "snipplets/svg/pinterest.tpl" with {fa_custom_class: "fa-md"} %}
    </a>
     <div class="pinterest-hidden hidden" data-network="pinterest">
        {{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}
    </div>
</div>