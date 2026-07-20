
{#/*============================================================================

custom-styles.scss.tpl

    -This file contains all the theme styles related to settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        -static/css/style.scss.tpl --> For the rest of the theme styles
        -static/css/checkout.scss.tpl --> For color and font styles related to config/settings.txt applied on the checkout

==============================================================================*/#}

{#/*============================================================================

  Table of Contents
  #Colors and fonts
    // Colors
    // Font families
    // Texts
  #Components
    // Mixins
    // Wrappers
    // Placeholders 
    // Breadcrumbs
    // Buttons
    // Links
    // Chips
    // Modals
    // Forms
    // Tabs
    // Cards
    // Panels
    // Pills
    // Dividers
    // Preloaders
    // Banners
    // Modules with image and text
    // Sliders
    // Tables
    // Video
  #Social
    // Instafeed
    // Facebook
  #Header and nav
    // Nav desktop
    // Search
    // Logo
  #Product grid
    // Filters
    // Grid item
    // Labels
    // Paginator
  #Product detail
    // Image
    // Form and info
  #Footer
  #Cart page
    // Cart table
    // Ajax cart
    // Totals
  #Utilities color classes
  #Media queries
    // Max width 767px
        //// Colors and fonts
        //// Components
        //// Header and nav
        //// Product grid
        //// Product detail

==============================================================================*/#}

{#/*============================================================================
  #Colors and fonts
==============================================================================*/#}

{# /* // Colors */ #}

$primary-color: {{ settings.primary_brand_color }};
$accent-color: {{ settings.accent_brand_color }};
$main-foreground: {{ settings.text_color }};
$main-background: {{ settings.background_color }};
$foreground-btn: lighten($main-background, 10%);

{# /* // Font families */ #}

$heading-font: {{ settings.font_headings | raw }};
$body-font: {{ settings.font_rest | raw }};
$logo-font: {{ settings.font_logo | raw }};

{# /* // Texts */ #}

{# /* Body */ #}

.font-medium {
    font-size: 16px;
}
body,
.font-body {
  font-size: 12px;
}
.font-small {
  font-size: 11px;
}
.font-small-extra {
  font-size: 10px;
}

body {
    background-color: $main-background;
}


{# /* Icons */ #}

.fa-min {
    font-size: 8px;
}
.fa-huge{
    font-size: 120px;
}

{# /* Weight */ #}

.weight-normal {
  font-weight: 400 !important;
}
.weight-strong {
  font-weight: 700 !important;
}
.weight-light {
  font-weight: 300 !important;
}

/* Color */

small{
    color:inherit !important;
}
.text-primary,
.text-primary:hover,
.text-primary:focus {
    color: $primary-color;
}
.text-accent {
    color: $accent-color;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Mixins */ #}

@mixin text-decoration-none(){
    text-decoration: none;
    outline: 0;
    &:hover,
    &:focus{
        text-decoration: none;
        outline: 0;
    }
}

@mixin link-default(){
    color:$main-foreground;
    &:hover,
    &:focus{
        color:$main-foreground;
        text-decoration: underline;
    }
}

@mixin border-radius() {
  border-radius: 3px;
}

@mixin drop-shadow(){
  -moz-box-shadow: 0 0 3px #ccc;
  -webkit-box-shadow: 0 0 3px #ccc;
  box-shadow: 0 0 3px #ccc;
}


{# /* // Wrappers */ #}

body{
    color: $main-foreground;
    font-family: $body-font;
    {% if settings.background_pattern %}
        background-image: url( "{{ ("images/patterns/" ~ settings.background_pattern ~ ".png") | static_url }}" );
    {% else %}
        background-color: $main-background;
    {% endif %}
}

{# /* Thin scrollbar (portfolio-2).
   Body usa filter:invert(1), así que:
   - scrollers internos: colores pre-invertidos (#000 track → blanco)
   - html (viewport): fuera del filter → blanco directo */ #}
* {
    scrollbar-width: thin;
    scrollbar-color: #777 #000;
}

*::-webkit-scrollbar {
    width: 6px;
    height: 6px;
}

*::-webkit-scrollbar-track {
    background: #000;
}

*::-webkit-scrollbar-thumb {
    background: #777;
    border-radius: 3px;
}

*::-webkit-scrollbar-thumb:hover {
    background: #999;
}

html {
    scrollbar-color: #888 #fff;
}

html::-webkit-scrollbar-track {
    background: #fff;
}

html::-webkit-scrollbar-thumb {
    background: #888;
}

html::-webkit-scrollbar-thumb:hover {
    background: #666;
}

.main-content {
    background-color: $main-background;
    color: $main-foreground;
}
.box-title {
  float: left;
  width: 100%;
  padding-bottom: 20px;
  font-weight: bold;
  font-size: 12px;
  text-transform: uppercase;
}

.bg-foreground {
    background: rgba($main-foreground, .05);
}

{# /* // Placeholders */ #}

.placeholder-container{
    background-color:$main-background;
}
.placeholder-figures-container{
    background-color:darken($main-background, 2%);
}
.product-placeholder-container{
    background: rgba($primary-color,.1);
}
.placeholder-preloader{
    fill:rgba($main-foreground, 0.07);
}
.placeholder-color,
.placeholder-line{
    background-color:rgba($main-foreground, 0.07);
}
.placeholder-color-primary{
    background-color:rgba($primary-color, 0.5);
}
.placeholder-icon{
    fill:rgba($main-foreground, 0.2);
}
.spinner-multicolor {
    width: 65px;
    height: 65px;
    -webkit-animation: rotator 1.4s linear infinite;
    animation: rotator 1.4s linear infinite;
    &-path {
        stroke-dasharray: 187;
        stroke-dashoffset: 0;
        -webkit-transform-origin: center;
        transform-origin: center;
        -webkit-animation: dash 1.4s ease-in-out infinite, colors 5.6s ease-in-out infinite;
        animation: dash 1.4s ease-in-out infinite, colors 5.6s ease-in-out infinite;
    }
}

@-webkit-keyframes rotator {
    0% {
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100% {
        -webkit-transform: rotate(270deg);
        transform: rotate(270deg);
    }
}

@keyframes rotator {
    0% {
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100% {
        -webkit-transform: rotate(270deg);
        transform: rotate(270deg);
    }
}

@-webkit-keyframes colors {
    0% {
        stroke: $primary-color;
    }
    50% {
        stroke: $accent-color;
    }
    50% {
        stroke: $primary-color;
    }
    75% {
        stroke: $accent-color;
    }
    100% {
        stroke: $primary-color;
    }
}

@keyframes colors {
    0% {
        stroke: $primary-color;
    }
    50% {
        stroke: $accent-color;
    }
    50% {
        stroke: $primary-color;
    }
    75% {
        stroke: $accent-color;
    }
    100% {
        stroke: $primary-color;
    }
}
@-webkit-keyframes dash {
    0% {
        stroke-dashoffset: 187;
    }
    50% {
        stroke-dashoffset: 46.75;
        -webkit-transform: rotate(135deg);
        transform: rotate(135deg);
    }
    100% {
        stroke-dashoffset: 187;
        -webkit-transform: rotate(450deg);
        transform: rotate(450deg);
    }
}
@keyframes dash {
    0% {
        stroke-dashoffset: 187;
    }
    50% {
        stroke-dashoffset: 46.75;
        -webkit-transform: rotate(135deg);
        transform: rotate(135deg);
    }
    100% {
        stroke-dashoffset: 187;
        -webkit-transform: rotate(450deg);
        transform: rotate(450deg);
    }
}

{# /* // SVG Icons */ #}

.svg-icon-primary{
   fill:$primary-color;
}
.svg-icon-text{
    fill:$main-foreground;
}
.svg-icon-background{
    fill:$main-background;
}

{# /* // Breadcrumbs */ #}

.breadcrumb{
    background: #070707 !important;
    background-color: #070707 !important;
    border-radius: 0;
    margin: 0;
    color: $main-foreground;
  &-crumb{
    color: $main-foreground;
    &.active{
        color: $main-foreground;
    }
  }
  &-divider{
    color: rgba($main-foreground, 0.45);
  }
}

.product-breadcrumb,
.product-breadcrumb.breadcrumb {
    background: #070707 !important;
    background-color: #070707 !important;
    margin: 0 !important;
    width: 100%;
    padding: 10px 15px;
    box-sizing: border-box;
}

.title-container .breadcrumb,
.breadcrumb-product .breadcrumb {
    width: auto;
    padding: 0;
    background: transparent !important;
    background-color: transparent !important;
}

.product-breadcrumb .breadcrumb-crumb,
.product-breadcrumb .breadcrumb-crumb.current {
    color: $main-foreground;
    text-shadow: none;
}

{# /* // Buttons */ #}

.btn{
    position: relative;
    padding: 10px 8px;
    background-color:transparent;
    border:0;
    text-transform: uppercase;
    @include text-decoration-none();
}
.btn-circle{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 47px;
    width: 100%;
    border:0;
    font-size: 20px;
    text-align:center;
    cursor: pointer;
    @include text-decoration-none();
    &:hover{
        opacity: 0.8;
    }
    i{
        vertical-align: sub;
    }
    &-small{
        height: 30px;
        width: 30px;
        i{
            font-size: 26px;
        }
    }
}
.btn-primary{
    background-color: white;
    color: #1E1E1E;
    border-radius: 0;
    &:hover{
        background-color: #1E1E1E;
        color: white;
        border-radius: 0;
    }
    &:focus,
    &:active,
    &:active:hover,
    &.active,
    &.active:hover,
    &.active:focus{
        background-color: #1E1E1E;
        color: white;
        border-radius: 0;
    }
    &[disabled],
    &[disabled]:hover{
        background-color: #DDD;
        color:$main-background;
        fill:$main-background;
        border-color: #DDD;
        border-radius: 0;
    }
    &.btn-transition.active,
    &.btn-transition[disabled],
    &.btn-transition[disabled]:hover,
    &.btn-transition.disabled,
    &.btn-transition.disabled:hover{
        background-color:lighten($accent-color, 3%);
        border-color:lighten($accent-color, 3%);
        color:$main-background;
        fill:$main-background;
        border-radius: 0;
    }
}
.js-addtocart,
.js-addtocart:hover,
.js-addtocart:focus,
.js-addtocart:active,
.js-addtocart.active,
.js-addtocart-placeholder {
    border-radius: 0 !important;
}

.added-to-cart-message,
.js-added-to-cart-product-message {
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    line-height: 1.4;

    .btn-link,
    a {
        font-size: 11px !important;
        font-weight: 700;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        line-height: 1.4;
        vertical-align: baseline;
    }
}
.btn-secondary{
    background-color: $primary-color;
    color:$main-background;
    fill:$main-background;
    border:1px solid $primary-color;
    border-radius: 0;
    &:hover{
        background-color:lighten($primary-color, 3%);
        color:$main-background;
    }
    &:focus,
    &:active,
    &:active:hover{
        background-color: $primary-color;
        color:$main-background;
    }
    &[disabled],
    &[disabled]:hover{
        background-color: #DDD;
        color:$main-background;
        border-color: #DDD;
    }
}
.btn-default{
    background: lighten($main-background, 3%);
    color:$accent-color;
    fill:$accent-color;
    border:1px solid rgba($main-foreground, 0.3);
    &:hover{
        background: lighten($main-background, 3%);
        color:$accent-color;
        fill:$accent-color;
        opacity: 0.8;
    }
    &:focus,
    &:active,
    &:active:hover{
        background: lighten($main-background, 3%);
        color:$accent-color;
        fill:$accent-color;
        opacity: 1;
    }
    &[disabled]{
        opacity: 0.5;
    }
}
.btn-floating{
    position:absolute;
    top: 0;
    right: 0;
    padding: 3px 4px 1px 4px;
    color:$primary-color;
    fill:$primary-color;
    background-color: transparent;
    font-size: 18px;
    z-index: 100;
    @include border-radius();
    line-height: 18px;
    &:hover,
    &:focus {
        opacity: 0.8;
    }
    &.fixed-bottom {
        position: fixed;
        top: auto;
        bottom: 20px;
        right: 15px;
    }
}
.btn-link{
    position:relative;
    cursor: pointer;
    color:$primary-color;
    text-transform: uppercase;
    &:hover,
    &:focus{
        color:$primary-color;
        opacity: 0.8;
    }
}
.btn-small{
    padding: 2px 10px;
    border-radius: 0;
    i{
        vertical-align: middle;
    }
}

.btn-whatsapp {
    color: white;
    background-color:#4dc247;
    box-shadow: 2px 2px 6px rgba(0,0,0,0.4);
    border-radius: 50%;
    svg {
        width: 39px;
        height: 40px;
        padding: 5px 2px;
        fill: white;
        vertical-align:middle;
    }
    visibility: hidden;
}

{# /* // Links */ #}

a,
a:hover,
a:focus{
    color: $main-foreground;
    &:active,
    &:focus,
    &:hover {
        outline: 0;
        box-shadow: none;
    }
}

.link-module{
    .link-icon svg {
        width: 20px;
        fill: $primary-color;
        vertical-align: bottom;
    }
}

.link-module + .link-module{
    border-top:0;
}

.link-module-icon{
    fill:$main-foreground;
}
.link-module-icon-right{
    fill:$accent-color;
}

{# /* // Chips */ #}

.chip {
    color: $main-foreground;
    background-color: rgba($main-foreground,.1);
    border: none;
    &-remove-icon{
        fill: $main-foreground;
        background: rgba($main-foreground, .2);
    }
    &:hover,
    &:focus {
        opacity: 0.8;
    }
}

{# /* // Icons */ #}

.svg-background-icon { 
    fill: $main-background;
}
.svg-maincolor-color { 
    fill: $primary-color;
}


{# /* // Modals */ #}

.modal-body,
.modal-dialog,
.modal-content,
.modal-xs-dialog{
    background: darken($main-background, 2%);
    color: $main-foreground;
}

.modal-header {
    border-bottom:1px solid rgba($main-foreground, 0.1);

    {# Bootstrap clearfix pseudo-elements break flex headers (title/X spacing) #}
    &:before,
    &:after {
        display: none !important;
        content: none !important;
    }
}

{# /* País de entrega / small centered modals */ #}
.js-modal-shipping-country.modal,
.js-modal-viewport-fixed.modal {
    .modal-dialog {
        width: 100% !important;
        max-width: 420px !important;
        margin: 0 auto !important;
        float: none !important;
        box-sizing: border-box !important;
    }

    .modal-content {
        margin: 0 !important;
        border-radius: 0;
        box-sizing: border-box !important;
    }

    .modal-header {
        position: relative;
        margin: 0;
        padding: 14px 44px 14px 15px !important;
        border-bottom: 1px solid rgba($main-foreground, 0.1);

        h3 {
            margin: 0 !important;
            padding: 0 !important;
            font-size: 12px !important;
            font-weight: 700;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            line-height: 1.3;
            text-align: left !important;
        }

        .btn-floating {
            position: absolute !important;
            top: 10px;
            right: 10px;
            margin: 0 !important;
            padding: 0 !important;
            width: 32px;
            height: 32px;
            display: -webkit-inline-box;
            display: -ms-inline-flexbox;
            display: inline-flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            float: none !important;

            svg {
                width: 14px;
                height: 14px;
            }
        }
    }

    .modal-body {
        padding: 15px !important;
    }

    .modal-footer {
        padding: 12px 15px 14px !important;
        text-align: left;
        border-top: 1px solid rgba($main-foreground, 0.1);
    }
}

{# /* Shipping pickup addresses modal — viewport-centered (also see layout.tpl html> rules) */ #}
.shipping-pickup-modal.modal,
.js-modal-shipping-suboptions.modal {
    position: fixed !important;
    top: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    left: 0 !important;
    width: 100% !important;
    max-width: none !important;
    height: 100% !important;
    max-height: none !important;
    margin: 0 !important;
    padding: 15px !important;
    overflow: hidden !important;
    background: transparent !important;
    border: 0 !important;
    border-radius: 0 !important;
    -webkit-transform: none !important;
    -ms-transform: none !important;
    transform: none !important;
    box-shadow: none !important;

    &.in,
    &.fade.in {
        display: -webkit-box !important;
        display: -ms-flexbox !important;
        display: flex !important;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        justify-content: center;
        opacity: 1 !important;
        -webkit-transform: none !important;
        -ms-transform: none !important;
        transform: none !important;
    }
}

.shipping-pickup-modal-dialog {
    width: 100% !important;
    max-width: 420px !important;
    max-height: 80vh !important;
    margin: 0 auto !important;
    float: none !important;
    -webkit-box-sizing: border-box !important;
    box-sizing: border-box !important;
}

.shipping-pickup-modal-content {
    display: -webkit-box !important;
    display: -ms-flexbox !important;
    display: flex !important;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    width: 100% !important;
    max-height: 80vh !important;
    overflow: hidden !important;
    border: 1px solid rgba($main-foreground, 0.12);
    border-radius: 0;
    background: $main-background !important;
    color: $main-foreground !important;
    box-shadow: 0 12px 40px rgba(0, 0, 0, 0.35);
    -webkit-box-sizing: border-box !important;
    box-sizing: border-box !important;
}

.shipping-pickup-modal-header {
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: start;
    -ms-flex-pack: start;
    justify-content: flex-start;
    gap: 12px;
    flex: 0 0 auto;
    width: 100% !important;
    margin: 0;
    padding: 15px 48px 15px 15px !important;
    border-bottom: 1px solid rgba($main-foreground, 0.1);
    cursor: pointer;
    -webkit-box-sizing: border-box !important;
    box-sizing: border-box !important;

    {# Bootstrap clearfix ::before/::after become flex items and wreck alignment #}
    &:before,
    &:after {
        display: none !important;
        content: none !important;
    }
}

.shipping-pickup-modal-title {
    margin: 0 !important;
    padding: 0 !important;
    font-size: 12px !important;
    font-weight: 700;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    line-height: 1.3;
    text-align: left !important;
}

.shipping-pickup-modal-close {
    position: absolute !important;
    top: 12px;
    right: 12px;
    display: -webkit-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    margin: 0 !important;
    padding: 0 !important;
    float: none !important;
    opacity: 1;
    color: $main-foreground;
    fill: $main-foreground;
    transition: opacity 0.15s ease;

    svg,
    .svg-icon-text,
    .svg-text-fill {
        width: 14px;
        height: 14px;
        fill: $main-foreground !important;
        color: $main-foreground !important;
    }

    &:hover {
        opacity: 0.7;
    }
}

.shipping-pickup-modal-body {
    float: none !important;
    flex: 1 1 auto !important;
    width: 100% !important;
    min-height: 0 !important;
    max-height: none !important;
    margin: 0 !important;
    padding: 0 !important;
    overflow-x: hidden !important;
    overflow-y: auto !important;
    -webkit-overflow-scrolling: touch;
}

.shipping-pickup-list {
    margin: 0;
    padding: 0;
}

.shipping-pickup-item {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: flex-start;
    -ms-flex-align: start;
    align-items: flex-start;
    gap: 10px;
    margin: 0 !important;
    padding: 12px 15px;
    border-bottom: 1px solid rgba($main-foreground, 0.08);
    text-transform: none !important;
    line-height: 1.45;

    &:last-child {
        border-bottom: 0;
    }
}

.shipping-pickup-item-icon {
    flex: 0 0 auto;
    margin-top: 2px;
    opacity: 0.55;
    line-height: 1;
}

.shipping-pickup-item-text {
    flex: 1 1 auto;
    min-width: 0;
    font-size: 12px;
    font-weight: 400;
    letter-spacing: 0.01em;
    text-transform: none;
    word-break: break-word;
}

.shipping-pickup-modal-footer {
    flex: 0 0 auto;
    padding: 12px 15px 14px;
    border-top: 1px solid rgba($main-foreground, 0.1);
    background: rgba($main-foreground, 0.03);
}

.shipping-pickup-modal-zip {
    margin-bottom: 6px;
    font-size: 11px;
    letter-spacing: 0.04em;
    text-transform: uppercase;

    strong {
        margin-left: 4px;
        font-weight: 700;
    }
}

.shipping-pickup-modal-hint {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: flex-start;
    -ms-flex-align: start;
    align-items: flex-start;
    gap: 6px;
    font-size: 11px;
    line-height: 1.4;
    opacity: 0.65;
    font-style: normal;

    i, em {
        font-style: normal;
    }
}

a.js-shipping-ver-direcciones,
a.js-shipping-ver-direcciones:hover,
a.js-shipping-ver-direcciones:focus,
a.js-shipping-ver-direcciones:active,
.shipping-suboption a.btn-link,
.shipping-suboption a.btn-link:hover,
.shipping-suboption a.btn-link:focus {
    text-decoration: none !important;
    border-bottom: 0 !important;
    box-shadow: none !important;
}

@media (max-width: 767px) {
    .shipping-pickup-modal.modal,
    .js-modal-shipping-suboptions.modal {
        padding: 15px !important;

        &.modal-xs-centered,
        &.modal-xs-centered.fade.in {
            width: 100% !important;
            height: 100% !important;
            top: 0 !important;
            left: 0 !important;
            -webkit-transform: none !important;
            -ms-transform: none !important;
            transform: none !important;
        }
    }

    .shipping-pickup-modal-dialog,
    .shipping-pickup-modal-content {
        max-height: 78vh !important;
    }
}

.modal-icon {
    .nav-icon { 
        color:#FFFFFF;
        fill:#FFFFFF;
    }
}

{# /* // Forms */ #}

.form-control {
    border: 0;
    background: #171717;
    box-shadow: none;
    -webkit-transition: none;
    &:focus {
        border-bottom: 2px solid $primary-color;
        &+ label{
           color: $primary-color;
        }
    }
}

.category-controls > .row {
    margin-left: 0;
    margin-right: 0;
}
.category-controls .sort-by-container {
    padding-left: 0 !important;
    padding-right: 0 !important;
}

.sort-by-container .sort-by.form-control,
.select-container .sort-by {
    border: 1px solid #2a2a2a;
    border-radius: 0;
    background: transparent;
    box-shadow: none;
    cursor: pointer;
    transition: background-color .15s ease;
    &:hover {
        background-color: #121212;
    }
    &:focus {
        border: 1px solid #2a2a2a;
        background-color: #121212;
        outline: none;
        box-shadow: none;
    }
}
.sort-by-container .sort-by-arrow {
    right: 8px;
    top: 50%;
    bottom: auto;
    transform: translateY(-50%);
    pointer-events: none;
}
.search-input{
    color:$primary-color;
    &:focus {
        border: 0;
    }
}

.radio-button {
    fill: $main-foreground;
    input[type="radio"]{
        & +  .radio-button-content .unchecked{
          border: 2px solid $primary-color;
        }
        & + .radio-button-content .checked{
          background-color: $primary-color;
        }
        & + .radio-button-content .radio-circle-checked{
          background-color: rgba($primary-color,.15);
        }
        &:checked + .radio-button-content{
            color: $primary-color;
            fill: $primary-color;
        }
    }
}

{# /*
   Spacing scale (product + shipping)
   x = 8px. Use only multiples / halves of x.
   0.5x=4 · 1x=8 · 1.5x=12 · 2x=16 · 3x=24 · 4x=32 · 5x=40 · 6x=48
*/ #}
$space-x: 8px;
$space-05: $space-x * 0.5;
$space-1: $space-x;
$space-15: $space-x * 1.5;
$space-2: $space-x * 2;
$space-3: $space-x * 3;
$space-4: $space-x * 4;
$space-5: $space-x * 5;
$space-6: $space-x * 6;

{# /*
   Shipping calculator type scale (product + cart)
   - Label / section: 11 / 700 / 0.08em
   - Primary (name, price, form): 12 / 700 / 0.06em
   - Secondary meta: 11 / 400 / 0.06em
   - Micro action: 10 / 700 / 0.10em
   All uppercase for a single editorial voice.
*/ #}
.product-shipping-calculator,
.shipping-calculator {
    font-size: 12px;
    line-height: 1.45;
    letter-spacing: 0.06em;
    text-transform: uppercase;

    {# /* Label / section */ #}
    .js-shipping-calculator-with-zipcode,
    .js-shipping-calculator-with-zipcode .d-table,
    .js-shipping-calculator-current-zip,
    .js-product-shipping-label,
    .shipping-smart-dates-note,
    .js-free-shipping-title,
    .js-free-shipping-title-min-cost,
    .js-free-shipping-message,
    .js-shipping-calculator-label,
    .js-shipping-calculator-label-default,
    .full-width-container {
        font-size: 11px;
        font-weight: 700;
        letter-spacing: 0.08em;
        line-height: 1.4;
        text-transform: uppercase;
    }

    .free-shipping-title.text-left,
    .free-shipping-title.text-left .js-free-shipping-title,
    .free-shipping-title.text-left .js-free-shipping-title-min-cost {
        text-align: left !important;
    }

    {# /* Spacing rhythm: 1x / 1.5x / 2x */ #}
    .full-width-container {
        float: left;
        clear: both;
        width: 100%;
        margin: 0 0 $space-1;
        padding: 0;
    }

    .shipping-calculator-response {
        clear: both;
        margin-top: $space-15 !important;
        padding-top: 0 !important;
        font-size: 12px;
    }

    .js-product-shipping-label {
        display: block;
        clear: both;
        margin: 0 0 $space-15 !important;
        padding: 0 !important;
    }

    .shipping-smart-dates-note {
        display: block;
        float: left;
        clear: both;
        width: 100%;
        margin: $space-15 0 0 !important;
        padding: 0 !important;
    }

    {# /* Primary */ #}
    .shipping-option-name,
    .shipping-option-extra,
    .shipping-price,
    .js-calculate-shipping,
    .shipping-zipcode {
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.06em;
        line-height: 1.4;
        text-transform: uppercase;
    }

    .shipping-price {
        display: block;
        font-size: 12px !important;
        line-height: 1.3;
    }

    {# /* Secondary meta */ #}
    .shipping-option-meta,
    .shipping-price-old,
    .shipping-calculator-response > .font-small {
        font-size: 11px !important;
        font-weight: 400;
        letter-spacing: 0.06em;
        line-height: 1.4;
        text-transform: uppercase;
        opacity: 0.65;
    }

    .shipping-calculator-response > .font-small strong {
        font-weight: 700;
        opacity: 1;
    }

    .shipping-option-meta {
        margin-top: $space-05;
    }

    .shipping-price-old {
        display: block;
        margin-top: $space-05;
        text-decoration: line-through;
        opacity: 0.45;
    }

    .shipping-calculator-response > .font-small {
        margin-top: $space-1;
    }

    .js-toggle-more-shipping-options {
        clear: both;
        margin: $space-1 0 0 !important;
        padding: 0 !important;
    }

    {# /* Micro actions */ #}
    .js-shipping-suboption .btn-link,
    .shipping-suboption .btn-link,
    .js-shipping-ver-direcciones,
    .js-shipping-calculator-change-zipcode,
    .js-shipping-zipcode-help,
    .js-toggle-more-shipping-options .btn-link {
        font-size: 10px !important;
        font-weight: 700;
        letter-spacing: 0.10em;
        line-height: 1.3;
        text-transform: uppercase;
    }

    .js-shipping-suboption .btn-link,
    .shipping-suboption .btn-link,
    .js-shipping-ver-direcciones {
        display: inline-flex;
        align-items: center;
        gap: 4px;
        margin-top: 2px;
        text-decoration: none !important;
        border-bottom: 0 !important;
        padding-bottom: 0;
        cursor: pointer;
        pointer-events: auto;
        position: relative;
        z-index: 2;
        box-shadow: none !important;

        &:hover,
        &:focus,
        &:active {
            text-decoration: none !important;
            border-bottom: 0 !important;
            opacity: 0.75;
        }
    }

    .js-shipping-calculator-change-zipcode {
        border: 1px solid #2a2a2a;
        border-radius: 0;
        padding: 6px 10px;
    }

    .radio-button-icons {
        display: none;
    }
    .box-container {
        float: left;
        clear: both;
        width: 100%;
        padding: 0;
        margin: 0 0 $space-2;
        box-shadow: none;
        border: 0;
        font-size: 12px;

        &.m-bottom {
            margin-bottom: $space-2 !important;
        }
    }
    .list-readonly .list-item,
    .list-item {
        margin: 0;
        padding: $space-15 0;
        border-bottom: 1px solid #2a2a2a;
        font-size: 12px;
        &:only-child,
        &:last-of-type {
            margin-bottom: 0;
            border-bottom: 0;
            padding-bottom: 0;
        }
        &:first-of-type {
            padding-top: 0;
        }
    }
    .radio-button-label {
        margin-top: 0;
        padding-left: 0;
    }
    .shipping-option-row {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        gap: 12px;
        width: 100%;
    }
    .shipping-option-info {
        flex: 1 1 auto;
        min-width: 0;
    }
    .shipping-option-suboptions {
        margin-top: 8px;
        position: relative;
        z-index: 2;
    }
    .shipping-option-price {
        flex: 0 0 auto;
        min-width: 7.5em;
        text-align: right;
        white-space: nowrap;
    }
    .radio-button-label,
    .radio-button-text,
    .btn-link-small,
    .h5 {
        font-size: 12px !important;
        line-height: 1.45;
        letter-spacing: 0.06em;
        text-transform: uppercase;
    }
}

{# /* Product form stack spacing — hierarchy via multiples of x */ #}
.product-form-container {
    {# 6x: title/price as hero block #}
    .product-title-price-row {
        margin-bottom: $space-6 !important;
    }

    {# 1x under CTA, 4x before shipping block #}
    .product-payments-link {
        margin: $space-1 0 $space-4 !important;
        padding: 0;
    }

    #product-shipping-container {
        margin-top: 0 !important;
        margin-bottom: $space-1 !important;
    }

    {# CTA + payments as one block: 4x air above #}
    .add-to-cart.m-bottom {
        margin-top: $space-4 !important;
        margin-bottom: 0 !important;
    }

    .js-product-form > .row.m-top {
        margin-top: $space-15 !important;
    }
}

{# /* Product shipping: kill fixed heights that leave empty air around free-shipping label */ #}
.product-shipping-calculator {
    .shipping-calculator-head {
        margin-top: 0 !important;
        margin-bottom: $space-3 !important; {# 3x below zip / free-shipping block #}
    }

    .shipping-calculator-head.with-zip,
    .shipping-calculator-head.with-zip.with-free-shipping,
    .shipping-calculator-head.with-form,
    .shipping-calculator-head.with-error {
        height: auto !important;
    }

    {# Keep the active panel in flow so height:auto actually wraps content #}
    .js-shipping-calculator-with-zipcode.transition-up-active,
    .js-shipping-calculator-form.transition-up-active {
        position: relative !important;
        top: 0 !important;
        opacity: 1 !important;
        pointer-events: auto !important;
    }

    .free-shipping-title {
        position: relative;
        height: auto !important;
        min-height: 0 !important;
        margin: 0 0 $space-1 !important;
        padding: 0 !important;
    }

    {# Absolute free-shipping labels leave a 50px hole; pin them in normal flow when active #}
    .free-shipping-title .js-free-shipping-title,
    .free-shipping-title .js-free-shipping-title-min-cost {
        position: static !important;
        display: none;
        width: auto !important;
        margin: 0 !important;
        padding: 0 !important;
        top: auto !important;
        -webkit-transform: none !important;
        -ms-transform: none !important;
        transform: none !important;
        opacity: 1 !important;
        pointer-events: auto !important;
    }

    .free-shipping-title .js-free-shipping-title.transition-up-active,
    .free-shipping-title .js-free-shipping-title-min-cost.transition-up-active {
        display: block !important;
    }
}

.product-form-container > .display-when-content-ready {
    margin-bottom: $space-1 !important;
}

{# /* Mobile PDP gutters: 15px content, gallery full-bleed (no stack with .container 10px) */ #}
@media (max-width: 767px) {
    .js-product-container.container {
        padding-left: 0 !important;
        padding-right: 0 !important;
    }
    .js-product-image-container {
        padding-left: 0 !important;
        padding-right: 0 !important;
    }
    .product-form-container.text-left {
        padding-left: 15px !important;
        padding-right: 15px !important;
    }
}

{# /* Payments modal spacing */ #}
#installments-modal {
    .modal-xs-header {
        padding: 15px !important;
        box-sizing: border-box;

        &:before,
        &:after {
            display: none !important;
            content: none !important;
        }
    }

    .modal-body,
    .modal-xs-body {
        padding: 15px !important;
    }

    .nav-tabs-container {
        margin: 0;
        padding: 0 15px;
        box-sizing: border-box;
    }

    .box-title {
        margin: 0 0 8px;
        padding: 0 0 8px;
        text-transform: uppercase;
        letter-spacing: 0.08em;
        font-size: 11px;
        font-weight: 700;
    }

    .box-container {
        margin: 0 0 16px;
        padding: 12px 0;
        box-shadow: none;
        border: 0;
        border-bottom: 1px solid #2a2a2a;

        &:last-child {
            margin-bottom: 0;
            border-bottom: 0;
        }
    }

    .divider {
        margin: 12px 0 !important;
    }

    h4 {
        margin: 0 0 8px;
    }

    .legal-info {
        margin: 0 0 8px;
        padding: 0 !important;
    }

    .installments-card {
        margin: 0 8px 8px 0;
    }

    .modal-header.with-tabs {
        padding: 0;
    }
}

{# /* // Tabs */ #}

.nav-tabs-container{
    border-bottom:1px solid rgba($main-foreground, 0.1);
}
.nav-tabs-links{
    border-bottom:0;
}
.nav-tabs {
    .tab.active{
        .tab-link{
            color: $primary-color;
            background-color:transparent;
            border:0;
            border-bottom:3px solid $primary-color;
        }
    }
    .tab-link{
        background-color: transparent;
        &:hover,
        &:focus{
            background-color: transparent!important;
        }
    }
    .tab-check.active{
        .tab-check-link,
        .tab-check-link:focus{
            outline:2px solid $primary-color;
        }
    }
    .tab-check-link-text{
        outline:1px solid rgba($main-foreground, .3);
    }
    .tab-check-icon{
        color: $primary-color;
        .fa-inverse{
            color:$main-background;
        }
    }
}

{# /* // Cards */ #}

.material-card{
    background-color:$main-background;
}

{# /* // Panels */ #}

.panel{
    background-color: $main-background;
    border:1px solid rgba($main-foreground, .2);
    @include border-radius();
    &-heading{
        background-color: $main-background!important;
        border-bottom:1px solid rgba($main-foreground, .2);
    }
    &-footer{
        background-color: $main-background;
        border-top:1px solid rgba($main-foreground, .2);
    }
}

{# /* // Pills */ #}

.pills-container{
    background-color:$main-background;
}
.pill-link{
    color: $primary-color;
    background-color: rgba($primary-color, .3);
    &:hover,
    &:focus{
        opacity: 0.6;
    }
}

{# /* // Dividers */ #}

.divider{
    float: left;
    width: 100%;
    margin: 20px 0;
    border-bottom:1px solid rgba($main-foreground, .1);
}

{# /* // Preloaders */ #}

.spinner{
    color:$primary-color;
    &.inverse{
        background: transparent;
        color:$main-background;
    }
}

{# /* // Banners */ #}

.banner-with-text {
    background: rgba($primary-color,.1);
    .text-container {
        color: white;
        .banner-with-text-title {
            font-family: $heading-font;
        }
    }
}

.banner-card .banner-info-container{
    background-color: $main-background;
}
.services-container{
    background-color: $main-background;
    .service-icon{
        color: $primary-color;
        fill: $primary-color;
        background:rgba($main-foreground, 0.05);
    }   
}

.marquee {
    height: 30px;
    overflow: hidden;
    background-color: #070707;
    color: #fff;
    padding-top: 10px;
    text-transform: uppercase;
    text-align: center;
    font-size: 10px;
    line-height: 16px;
}

{# /* // Modules with image and text */ #}

.module-text-wrapper {
    background-color: $main-background;
}

.module-image .placeholder {
    background-color: darken($main-background, 5%);
}

{# /* // Sliders */ #}

.slider-wrapper{
    background-color: $main-background;
}

.swiper-button-invert{
    fill: $main-background;
    -webkit-filter: drop-shadow( 0 0 2px rgba(0, 0, 0, .7));
    filter: drop-shadow( 0 0 2px rgba(0, 0, 0, .7));
}
.swiper-pagination-bullet {
    background: $main-foreground;
}
.swiper-pagination-bullet-active {
    background: $primary-color;
}

{# /* // Tables */ #}

.table-striped {
    tbody>tr:nth-child(odd) {
        >th,
        >td {
            background-color: rgba($main-foreground, .03);
            border-top:0;
        }
    }
    >tbody>tr>td {
        border-top:0;
    }
}
.table {
    >thead>tr>th,
    >tbody>tr>th,
    >tfoot>tr>th,
    >thead>tr>td,
    >tbody>tr>td,
    >tfoot>tr>td{
        border:0;
    }
}

{# /* // Video */ #}

.video-container {
    background: rgba($primary-color,.1);
}

.embed-responsive {
  background: $main-foreground;
}

{#/*============================================================================
  #Social
==============================================================================*/#}

{# /* // Instafeed */ #}

.instafeed-module {
    .instafeed-item {
        position: relative;
        @include border-radius();
        @include drop-shadow();   
        .instafeed-info { 
            background-color: $accent-color;
            color:$main-background;
            fill:$main-background;
        }
        &.instafeed-user {
            .instafeed-title {
                background-color: $accent-color;
                color:$main-background;
                a {
                    color:$main-background;
                    &:hover{
                        text-decoration: none;
                    }
                }
            }
        }
    }
    .svg-social-icon {
        height:34px;
    }
}

{# /* // Facebook */ #}

{% if has_logo %}
.fb-page-img-container{
    background: $main-background;
}
{% endif %}


{#/*============================================================================
  #Header and nav
==============================================================================*/#}

{# /* // Nav desktop */ #}

.navbar{
    background-color: $primary-color;
    color:$foreground-btn;
}
.nav-main{
    .nav-top{
        background-color:darken($primary-color, 30%);
        &-link{
            color: white;
        }
    }
    .desktop-nav{
        & > .desktop-nav-item.selected{
            border-bottom: 3px solid $foreground-btn;
        }
        &-item,
        &-link{
            color:$foreground-btn;
        }
        &-list{
        }
    }
}
.nav-icon{
    color:#FFFFFF;
    fill:#FFFFFF;
}
.cart-summary-items{
    background-color:$main-background;
    color:$primary-color; 
}
.cart-summary-icon{
    color: #FFFFFF;
    fill: #FFFFFF;
}
.inverse{
  background: white;
  color:$primary-color;
  a,
  i,
  input{
    background: white;
    color:$primary-color;
    &::-webkit-input-placeholder,
    &:-moz-placeholder,
    &::-moz-placeholder,
    &:-ms-input-placeholder{
        color:$primary-color;
    }
  }
}

{# /* // Search */ #}

.search-suggest{
    background-color: $main-background;
    &-link,
    &-icon{
        color: rgba($main-foreground, 0.8);
        &:hover,
        &:focus{
            color: rgba($main-foreground, 0.6);
            background-color: darken($main-background, 3%);
        }
    }
    &-price{
        color: $primary-color;
        font-weight: bold;
    }
    &-all-link{
        background-color: darken($main-background, 3%);
    }
}

{# /* // Logo */ #}

.logo-text{
    color: $primary-color;
    line-height: initial;
}

{#/*============================================================================
  #Product grid
==============================================================================*/#}

{# /* // Filters */ #}

.checkbox-container{
    .checkbox {
        color: $main-foreground;
        &-color {
            border: 1px solid rgba($main-foreground,.1);
        }
        &:hover input ~ .checkbox-icon {
            border: 2px solid $primary-color;
        }
        input:checked ~ .checkbox-icon {
            border: 2px solid $primary-color;
            background: $primary-color;
        }
        &-icon {
            background: $main-background;
            border: 2px solid $main-foreground;
            border-radius: 3px;
            &:after {
                border: solid $main-background;
                border-width: 0 3px 3px 0;
            }
        }
    }
}

.filters-overlay {
    background-color: rgba($main-background, .85);
}

{# /* // Grid item */ #}

.item-container .item,
.item {
    border-radius: 0 !important;
    box-shadow: none !important;
}

.item{
    &-image-container{
        background-color: #070707;
    }
    &-price,
    &-price-compare{
         color:$primary-color;
     }
    &-info-container{
        background-color: #070707;
       
        &-name{
            @include link-default();
        }
    }
    &-installments strong{
        color:$primary-color;
    }
    &-quickshop-link{
        background-color: $primary-color;
        color:$main-background;
        &:hover,
        &:focus{
            color:$main-background;
        }
    }
    &-colors-bullet {
        border: 1px solid rgba($main-foreground, .5);
        background: $main-background;
        &.selected {
            border: 2px solid $main-foreground;
        }
    }
}

/* Colecciones: info más cerca de la foto; sin aire extra antes de la siguiente fila */
.category-products-grid .item-info-container {
    padding-top: 2px !important;
    padding-bottom: 0 !important;
}

{# /* // Labels */ #}

.product-label{
    color: $foreground-btn;
    fill: $foreground-btn;
    &.product-label-offer{
        background-color: rgba($primary-color,.8);
    }
    &.product-label-shipping{
        background-color:rgba($accent-color,.8);
    }
    &.product-label-no-stock{
        background-color: grey;
        color:white;
    }
}

.label-accent {
    background-color: rgba($primary-color,.8);
    color: $foreground-btn;
}

.label-primary {
  background-color: $accent-color;
}

{# /* // Paginator */ #}

.pagination{
    &>li>a{
        background-color: $main-background;
        color:$main-foreground;
        fill:$main-foreground;
        padding: 6px 8px;
        min-width: 42px;
    }
    &>li>a:hover{
        background-color: rgba($primary-color, .05);
        color:$main-foreground;
        fill:$main-foreground;
    }
    &>.active>a,
    &>.active>a:focus,
    &>.active>a:hover{
        background-color:$primary-color;
        border-color:$primary-color;
    }
    &-icon{
        float: left;
        color:$main-foreground;
        fill:$main-foreground;
    }
}

{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Header */ #}

.product-name{
    color: $main-foreground;
}

{# Keep PDP product title as the sole h1 without inheriting Bootstrap h1 size #}
h1.product-name {
    font-size: 14px;
    line-height: 1.42857143;
    margin: 0;
}

.page-header-title {
    margin: 0 0 15px;
    font-size: 24px;
    font-weight: 700;
    text-transform: uppercase;
}

{# Category UI already exposes the name via breadcrumbs; h1 remains for SEO/a11y #}
.page-header-title-category {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0;
}

{# /* // Image */ #}

.mobile-zoom-panel{
    background:$main-background;
}

.product-thumb{
    background:$main-background;
    border: 1px solid rgba($main-foreground, .5);
    &.active{
        border: 1px solid $primary-color;
    }
}

{# /* // Form and info */ #}

.product-price-container{
    .product-price{
        display: inline-block;
        margin: 0;
        color: $primary-color;
        font-weight: bold;
    }
}
.price-compare {
    display: inline-block;
    margin: 0 5px 0 0;
    padding-right: 10px;
    text-decoration: line-through;
    border-right: 1px solid rgba($main-foreground, .5);
    opacity: 0.8;
    &.no-line{
        margin: 0;
        padding: 0;
        border-right: 0;
    }
}


.btn-variant { 
    color: $main-foreground;
    border: 2px solid rgba($main-foreground, 0.2); 
    &:hover,
    &:focus{
        color: $main-foreground;
    }
    &.selected{
        border: 2px solid $primary-color;
    }
} 
.product-variants{
    margin-bottom: 20px;
}

{#/*============================================================================
  #Footer
==============================================================================*/#}

.footer{
   background-color: #070707;
   color: #FFFFFF;
    /* Sin padding horizontal en el container: el gutter de 15px lo dan
       las cols Bootstrap (igual que antes entre columnas). Así solo
       se mueve el borde exterior al margen del sitio. */
    > .container,
    .footer-legal > .container {
        padding-left: 0 !important;
        padding-right: 0 !important;
        width: 100%;
        max-width: none;
    }
    a{
        color:#FFFFFF;
        text-transform: uppercase;
    }
    a:hover,
    a:focus,
    a:active {
        text-decoration: underline;
        transform: scaleX(0);
        webkit-transition: all .3s ease-in-out;
        transition: all .3s ease-in-out;
    }
    .btn-footer{
        background:$main-background;
        color: darken($primary-color, 18%);
        fill: darken($primary-color, 18%);
        &:hover,
        &:focus,
        &:active,
        &:active:hover{
            color: darken($primary-color, 18%);
            fill: darken($primary-color, 18%);
            opacity: 0.8;
        }
        svg {
            fill: darken($primary-color, 18%);
        }
    }
    @include text-decoration-none();
    .svg-background-icon { 
        fill: $main-background;
    }
    .svg-maincolor-color { 
        fill: darken($primary-color, 18%);
    }
}
.footer-legal{
   color: #FFFFFF;
   background-color: #070707;
}

.footer-title {
    font-weight: bold;
}
.powered-by-logo svg { 
   fill: #FFFFFF;
   max-width: 70px;
   margin: 0;
}


.cart-empty-state,
.empty-cart-messages.cart-empty-state {
    margin: 24px 0;
    padding: 0;
    background: transparent !important;
    border: 0 !important;
    box-shadow: none !important;
    color: inherit !important;
}

.cart-empty-state-text {
    margin: 0 0 12px;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    line-height: 1.45;
    opacity: 0.55;
}

.cart-empty-state-link {
    display: inline-block;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    text-decoration: none;
    border-bottom: 1px solid currentColor;
    padding-bottom: 1px;
}

{#/*============================================================================
  #Cart — grid layout (panel + page)
==============================================================================*/#}

{# /* Shared item grid — fixed qty/subtotal tracks so header + rows align */ #}
.cart-item-grid {
    display: grid;
    grid-template-columns: 64px minmax(0, 1fr) 100px 110px 28px;
    grid-template-areas: "thumb info qty subtotal delete";
    gap: 12px;
    align-items: start;
    width: 100%;
    padding: 14px 0;
    margin: 0;
    float: none;
    border-bottom: 1px solid #2a2a2a;
    background: transparent;

    &:last-child {
        border-bottom: 0;
    }
}

.cart-item-grid-header {
    display: grid;
    grid-template-columns: 64px minmax(0, 1fr) 100px 110px 28px;
    grid-template-areas: "product product qty subtotal delete";
    gap: 12px;
    align-items: end;
    padding: 0 0 10px;
    margin-bottom: 4px;
    border-bottom: 1px solid #2a2a2a;
    font-size: 10px;
    font-weight: 700;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    background: transparent;

    span {
        opacity: 0.55;
    }
}

.cart-item-grid-header-product {
    grid-area: product;
}

.cart-item-grid-header-qty {
    grid-area: qty;
    justify-self: start;
    text-align: left;
    width: 100%;
}

.cart-item-grid-header-subtotal,
.cart-item-grid-header-price {
    grid-area: subtotal;
    justify-self: end;
    text-align: right;
    width: 100%;
}

.cart-item-grid-header-delete {
    grid-area: delete;
}

.cart-item-grid-thumb {
    grid-area: thumb;
    display: block;
    width: 64px;
    overflow: hidden;
    background: #070707;

    img {
        display: block;
        width: 100%;
        height: auto;
    }
}

.cart-item-grid-info {
    grid-area: info;
    min-width: 0;
}

.cart-item-name,
.ajax-cart-item-link {
    a {
        display: block;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.04em;
        text-transform: uppercase;
        text-decoration: none;
        line-height: 1.35;
        color: inherit;

        small {
            display: block;
            margin-top: 2px;
            font-size: 10px;
            font-weight: 400;
            letter-spacing: 0.06em;
            opacity: 0.55;
            text-transform: uppercase;
        }
    }
}

.cart-item-unit-price,
.ajax-cart-item-unit-price {
    margin-top: 6px;
    font-size: 11px;
    letter-spacing: 0.02em;
    opacity: 0.65;
    float: none;
    width: auto;
}

.cart-item-free-label {
    margin-top: 6px;
}

.cart-item-grid-qty,
.cart-quantity-controls {
    grid-area: qty;
    display: inline-flex;
    align-items: center;
    justify-self: start;
    gap: 0;
    float: none;
}

.cart-item-grid .cart-quantity-input-container {
    position: relative;
    float: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 36px;
    margin: 0;
}

.cart-item-grid .cart-quantity-input {
    width: 36px;
    height: 28px;
    padding: 0;
    margin: 0;
    border: 1px solid #2a2a2a;
    border-left: 0;
    border-right: 0;
    border-radius: 0;
    background: #070707;
    color: #fff !important;
    text-align: center;
    font-size: 12px;
    font-weight: 700;
    -moz-appearance: textfield;
    opacity: 1;

    &::-webkit-outer-spin-button,
    &::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
}

.cart-item-grid .cart-quantity-btn,
.cart-item-grid .btn.cart-quantity-btn {
    float: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 28px;
    height: 28px;
    padding: 0;
    margin: 0;
    border: 1px solid #2a2a2a;
    border-radius: 0;
    background: #070707;
    color: #fff;
    fill: #fff;
    box-shadow: none;

    svg {
        fill: #fff !important;
        color: #fff;
    }
}

.cart-item-grid .cart-item-spinner,
.cart-item-grid .js-cart-input-spinner {
    position: absolute;
    top: 50%;
    left: 50%;
    margin: 0 !important;
    transform: translate(-50%, -50%);
    z-index: 2;
    width: 100%;
    height: 100%;
    pointer-events: none;
    background: #070707;
    text-align: center;
    line-height: 28px;

    svg,
    .svg-text-fill {
        vertical-align: middle;
    }
}

.cart-item-grid-subtotal {
    grid-area: subtotal;
    text-align: right;
    white-space: nowrap;
    font-size: 12px;
    letter-spacing: 0.02em;
    align-self: start;
    padding-top: 2px;
}

.cart-item-grid-delete {
    grid-area: delete;
    display: flex;
    justify-content: flex-end;
    float: none;
}

.cart-item-grid .cart-btn-delete,
.cart-item-grid .btn.cart-btn-delete {
    float: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 28px;
    height: 28px;
    padding: 0;
    margin: 0;
    border: 0;
    background: transparent;
    box-shadow: none;
    opacity: 0.55;

    &:hover {
        opacity: 1;
    }
}

{# /* Summary rows */ #}
.cart-summary-row {
    display: flex;
    align-items: baseline;
    justify-content: space-between;
    gap: 12px;
    width: 100%;
    float: none;
    margin: 0;
    padding: 8px 0;
    font-size: 12px;
    line-height: 1.4;
}

.cart-summary-label {
    flex: 1 1 auto;
    min-width: 0;
    text-align: left;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    font-size: 11px;
    font-weight: 700;
}

.cart-summary-value {
    flex: 0 0 auto;
    text-align: right;
    white-space: nowrap;
    font-size: 12px;
}

.cart-summary-total {
    padding-top: 12px;
    margin-top: 4px;
    border-top: 1px solid #2a2a2a;

    .cart-summary-label,
    .cart-summary-value {
        font-size: 14px;
        font-weight: 700;
    }
}

.cart-installments {
    margin-top: 4px;
    text-align: right;
    font-size: 11px;
    opacity: 0.65;
    float: none;
    clear: none;
}

{# /* Ajax cart panel */ #}
.ajax-cart-container {
    background: #070707;

    .ajax-cart-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        padding: 28px 15px 16px;
        border-bottom: 1px solid #2a2a2a;
        float: none;
    }

    .ajax-cart-title {
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.14em;
        text-transform: uppercase;
    }

    .ajax-cart-close {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        flex: 0 0 32px;
        width: 32px;
        height: 32px;
        float: none;
        position: relative;
        opacity: 1;
        color: #fff;
        fill: #fff;

        &:hover {
            opacity: 0.7;
        }

        .ajax-cart-close-icon,
        svg {
            display: block;
            width: 20px !important;
            max-width: 20px !important;
            height: 20px !important;
            fill: #fff !important;
            color: #fff;
        }
    }

    {# Mobile header: own visibility (avoid Bootstrap .visible-xs display:block !important) #}
    .ajax-cart-mobile-header {
        display: none;
    }

    .ajax-cart-body {
        padding: 0 15px 24px;
    }

    .ajax-cart-table-wrap,
    .cart-table {
        float: none;
        width: 100%;
        margin: 0 0 8px;
        padding: 0;
        background: transparent;
    }

    .ajax-cart-table {
        float: none;
        width: 100%;
    }

    .ajax-cart-promotions,
    .total-promotions {
        float: none;
        width: 100%;
        margin: 0;
    }

    .ajax-cart-shipping {
        margin-top: 12px;
        padding-top: 12px;
        border-top: 1px solid #2a2a2a;
    }

    .ajax-cart-total-container,
    .cart-total {
        float: none;
        width: 100%;
        margin: 8px 0 0;
        color: inherit;
    }

    .ajax-cart-bottom {
        float: none;
        width: 100%;
        margin-top: 16px;
        padding-top: 4px;
    }

    .ajax-cart-checkout-btn,
    .btn.ajax-cart-checkout-btn {
        width: 100%;
        height: 48px;
        margin: 0;
        padding: 0 16px;
        border: 0;
        border-radius: 0;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.14em;
        text-transform: uppercase;
        background: #fff;
        color: #070707;
    }

    .ajax-cart-continue {
        margin-top: 10px;
        padding: 0;
        font-size: 11px;
        font-weight: 700;
        letter-spacing: 0.1em;
        text-transform: uppercase;
        text-decoration: none;
        border-bottom: 1px solid currentColor;
        display: inline-block;
        width: auto;
        float: none;
    }

    {# Empty cart: no Bootstrap alert (invert turns alert-info into brown bar) #}
    .cart-empty-state,
    .js-empty-ajax-cart {
        margin: 24px 0 8px;
        padding: 0;
        background: transparent !important;
        border: 0 !important;
        border-radius: 0 !important;
        box-shadow: none !important;
        color: inherit !important;
    }

    .cart-empty-state-text {
        margin: 0;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        line-height: 1.45;
        opacity: 0.55;
    }
}

{# /* Cart page */ #}
.cart-page-form,
#shoppingCartPage {
    .cart-page-table,
    .cart-table {
        float: none;
        width: 100%;
        margin: 0 0 24px;
        padding: 0;
        background: transparent;
    }

    .cart-item-grid-page {
        grid-template-columns: 80px minmax(0, 1fr) auto auto auto 28px;
        grid-template-areas: "thumb info qty price subtotal delete";
    }

    .cart-item-grid-header-page {
        grid-template-columns: 80px minmax(0, 1fr) auto auto auto 28px;
    }

    .cart-item-grid-price {
        grid-area: price;
        text-align: right;
        white-space: nowrap;
        font-size: 12px;
        align-self: start;
        padding-top: 2px;
    }

    .cart-page-totals {
        display: grid;
        grid-template-columns: 1fr;
        gap: 24px;
        padding: 0 0 40px;
        margin: 0;
        float: none;
    }

    .cart-page-fulfillment,
    .cart-page-summary {
        float: none;
        width: 100%;
        text-align: left;
    }

    .cart-page-summary {
        padding-top: 8px;
        border-top: 1px solid #2a2a2a;
    }

    .cart-page-cta {
        margin-top: 16px;
    }

    .ajax-cart-checkout-btn,
    .btn.ajax-cart-checkout-btn {
        width: 100%;
        max-width: 320px;
        height: 48px;
        margin: 0;
        padding: 0 16px;
        border: 0;
        border-radius: 0;
        float: none;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.14em;
        text-transform: uppercase;
        background: #fff;
        color: #070707;
    }

    .cart-continue-mobile {
        margin-top: 12px;
    }

    .cart-total,
    .total-promotions-row {
        color: inherit;
    }
}

@media (min-width: 768px) {
    #shoppingCartPage .cart-page-totals,
    .cart-page-form .cart-page-totals {
        grid-template-columns: 1fr minmax(280px, 360px);
        align-items: start;
    }

    #shoppingCartPage .cart-page-summary,
    .cart-page-form .cart-page-summary {
        border-top: 0;
        padding-top: 0;
        padding-left: 24px;
        border-left: 1px solid #2a2a2a;
    }
}

@media (max-width: 767px) {
    {# Mobile cart item: thumb | name+price | delete / qty | subtotal #}
    .cart-item-grid,
    .ajax-cart-container .cart-item-grid,
    .cart-page-form .cart-item-grid,
    #shoppingCartPage .cart-item-grid {
        position: relative;
        display: grid;
        grid-template-columns: 64px minmax(0, 1fr) 28px;
        grid-template-areas:
            "thumb info delete"
            "thumb qty subtotal";
        gap: 10px 12px;
        align-items: start;
        padding: 14px 0;
        float: none;
    }

    .cart-item-grid-thumb {
        width: 64px;
        align-self: stretch;

        img {
            height: 100%;
            object-fit: cover;
        }
    }

    .cart-item-grid-info {
        min-width: 0;
    }

    .cart-item-name,
    .ajax-cart-item-link,
    .cart-item-grid .cart-item-name {
        float: none;
        width: auto;
        padding: 0;
        margin: 0;

        a {
            font-size: 11px;
            line-height: 1.35;
            padding-right: 0;
        }
    }

    .cart-item-unit-price,
    .ajax-cart-item-unit-price {
        margin-top: 4px;
        font-size: 11px;
    }

    .cart-item-grid-qty {
        align-self: end;
        justify-self: start;
    }

    .cart-item-grid .cart-quantity-btn,
    .cart-item-grid .btn.cart-quantity-btn {
        width: 32px;
        height: 32px;
    }

    .cart-item-grid .cart-quantity-input {
        width: 40px;
        height: 32px;
        font-size: 13px;
    }

    .cart-item-grid-subtotal,
    .cart-item-grid .cart-item-subtotal {
        align-self: end;
        justify-self: end;
        margin: 0;
        padding: 0;
        text-align: right;
        font-size: 12px;
        white-space: nowrap;
    }

    .cart-item-grid-delete,
    .cart-item-grid .cart-delete-container {
        position: static;
        right: auto;
        padding: 0;
        justify-self: end;
        align-self: start;
    }

    .cart-item-grid-page {
        grid-template-columns: 64px minmax(0, 1fr) 28px;
        grid-template-areas:
            "thumb info delete"
            "thumb qty subtotal";
    }

    .cart-item-grid-page .cart-item-grid-price {
        display: none;
    }

    {# Full-screen mobile panel polish #}
    .ajax-cart-container.modal-xs,
    .ajax-cart-container.modal-xs-right {
        background: #070707;
    }

    .ajax-cart-container {
        .ajax-cart-body,
        .modal-xs-body {
            padding: 0 15px 28px;
        }

        .ajax-cart-mobile-header {
            display: flex !important;
            flex-direction: row !important;
            flex-wrap: nowrap !important;
            align-items: center !important;
            gap: 12px;
            padding: 28px 15px 18px;
            padding-top: calc(28px + env(safe-area-inset-top, 0px));
            border-bottom: 1px solid #2a2a2a;
            text-decoration: none !important;
            color: inherit;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            font-size: 11px;
            font-weight: 700;
            line-height: 1;
            box-sizing: border-box;
        }

        .ajax-cart-mobile-back {
            display: inline-flex !important;
            flex: 0 0 24px !important;
            align-items: center;
            justify-content: center;
            width: 24px !important;
            min-width: 24px !important;
            max-width: 24px !important;
            height: 24px;
            margin: 0;
            padding: 0;
        }

        .ajax-cart-back-icon,
        .ajax-cart-mobile-back svg,
        .ajax-cart-mobile-header .ajax-cart-back-icon {
            position: static !important;
            top: auto !important;
            left: auto !important;
            right: auto !important;
            display: block !important;
            width: 22px !important;
            max-width: 22px !important;
            min-width: 22px !important;
            height: 22px !important;
            margin: 0 !important;
            flex: none !important;
            fill: #fff !important;
            color: #fff;
        }

        .ajax-cart-mobile-title {
            display: block !important;
            flex: 1 1 auto !important;
            min-width: 0 !important;
            margin: 0 !important;
            padding: 0 !important;
            font-size: 11px !important;
            font-weight: 700;
            letter-spacing: 0.1em;
            line-height: 1.2;
            text-transform: uppercase;
            text-decoration: none !important;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .ajax-cart-checkout-btn,
        .btn.ajax-cart-checkout-btn {
            width: 100%;
            max-width: none;
            height: 52px;
        }

        .ajax-cart-continue {
            display: block;
            width: 100%;
            margin-top: 14px;
            text-align: center;
            border-bottom: 0;
            text-decoration: underline;
            text-underline-offset: 3px;
        }

        .cart-summary-row {
            padding: 10px 0;
        }

        .cart-summary-total {
            .cart-summary-label,
            .cart-summary-value {
                font-size: 15px;
            }
        }

        .cart-item-grid .cart-quantity-input {
            color: #fff !important;
            opacity: 1 !important;
        }

        .cart-item-grid .cart-quantity-btn svg {
            fill: #fff !important;
        }
    }

    #shoppingCartPage {
        padding-left: 15px;
        padding-right: 15px;

        .cart-page-summary {
            border-top: 1px solid #2a2a2a;
            padding-top: 12px;
        }

        .ajax-cart-checkout-btn,
        .btn.ajax-cart-checkout-btn {
            max-width: none;
            width: 100%;
        }
    }

    .cart-table-row.cart-item-grid {
        position: relative;
    }
}


{# /* // Alerts and notifications */ #}

.alert-primary {
    border:1px solid $primary-color;
    color: $primary-color;
    background-color:darken($main-background, 2%);
    .btn-link {
        color: $primary-color;
    }
}

.notification-primary{
  color: $primary-color;
  background-color: $main-background;
}

.notification-secondary {
  background: darken($main-background, 3%);
  color: rgba($main-foreground, .8);
  a {
    color: $accent-color;
  }
}

.notification-foreground {
    background-color: lighten($main-foreground, 2%);
    color: $main-background;
    a,
    svg {
        color: $main-background;
        fill: $main-background;
    }
    .btn-notification {
        padding: 8px 10px;
        background-color: $main-background;
        color: $main-foreground;
        border: 0;
    }
}

.notification-footer {
    background-color:darken($main-background, .5%);
}

{# /* Cart add-to-cart toast — same voice as cart panel / shipping */ #}
.cart-toast.notification-floating {
    width: 320px;
    max-width: calc(100vw - 24px);
    border-radius: 0;
    box-shadow: none;
}

.cart-toast-card.notification,
.cart-toast-card {
    float: none !important;
    width: 100%;
    padding: 0 !important;
    text-align: left !important;
    border: 1px solid #2a2a2a !important;
    border-radius: 0 !important;
    background: #070707 !important;
    color: #fff !important;
    fill: #fff !important;
    box-shadow: none !important;
}

.cart-toast-close {
    position: absolute;
    top: 8px;
    right: 8px;
    z-index: 2;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 28px;
    height: 28px;
    padding: 0;
    border: 0;
    background: transparent;
    color: #fff;
    fill: #fff;
    opacity: 0.55;
    cursor: pointer;

    svg,
    .svg-icon-text,
    .svg-text-fill {
        width: 12px;
        height: 12px;
        fill: #fff !important;
        color: #fff !important;
    }

    &:hover,
    &:focus {
        opacity: 1;
        outline: 0;
    }
}

.cart-toast-status {
    padding: 14px 40px 0 14px;
    font-size: 10px;
    font-weight: 700;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    line-height: 1.3;
    opacity: 0.55;
}

.cart-toast-item {
    display: flex;
    align-items: flex-start;
    gap: 12px;
    padding: 12px 14px 14px;
}

.cart-toast-img {
    flex: 0 0 56px;
    width: 56px;
    overflow: hidden;
    background: #070707;

    img {
        display: block;
        width: 100%;
        height: auto;
    }
}

.cart-toast-info {
    flex: 1 1 auto;
    min-width: 0;
    padding-right: 4px;
}

.cart-toast-name {
    margin-bottom: 4px;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    line-height: 1.35;
    word-break: break-word;
    color: #fff;
}

.cart-toast-variant {
    display: block;
    margin-top: 2px;
    font-size: 10px;
    font-weight: 400;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    opacity: 0.55;
}

.cart-toast-meta {
    margin-top: 6px;
    font-size: 11px;
    font-weight: 400;
    letter-spacing: 0.02em;
    opacity: 0.65;
}

.cart-toast-meta-sep {
    margin: 0 2px;
}

.cart-toast-footer {
    width: auto !important;
    margin: 0 !important;
    padding: 12px 14px 14px !important;
    border-top: 1px solid #2a2a2a;
    border-radius: 0 !important;
    background: transparent !important;
}

.cart-toast-total {
    display: flex;
    align-items: baseline;
    justify-content: space-between;
    gap: 12px;
    margin-bottom: 12px;
}

.cart-toast-total-label {
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 0.08em;
    text-transform: uppercase;
}

.cart-toast-total-count {
    margin-left: 4px;
    font-weight: 400;
    letter-spacing: 0.04em;
    opacity: 0.55;
    text-transform: lowercase;
}

.cart-toast-total-price {
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 0.02em;
    text-transform: uppercase;
    white-space: nowrap;
}

.cart-toast-cta.btn,
.cart-toast-cta {
    display: block;
    width: 100%;
    margin: 0;
    padding: 10px 14px;
    border: 0 !important;
    border-radius: 0 !important;
    background: #fff !important;
    color: #1e1e1e !important;
    font-size: 11px !important;
    font-weight: 700;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    text-align: center;
    text-decoration: none !important;
    line-height: 1.3;

    &:hover,
    &:focus,
    &:active {
        background: #1e1e1e !important;
        color: #fff !important;
        text-decoration: none !important;
        outline: 0;
    }
}

@media (max-width: 767px) {
    .cart-toast.notification-floating {
        width: calc(100% - 20px);
    }
}

{#/*============================================================================
  #Utilities color classes
==============================================================================*/#}

.border-top {
  border-top: 1px solid rgba($main-foreground, 0.2) !important;
}
.border-bottom {
  border-bottom: 1px solid rgba($main-foreground, 0.2);
}

.border-right {
    border-right: 1px solid $primary-color;
}

{# /* // Social networks colors */ #}

.bg-facebook{
  background: #3b5998;
}
.bg-twitter{
  background: #55acee;
}
.bg-google-plus{
  background: #dc4e41;
}
.bg-pinterest{
  background: #bd081c;
}
.bg-instagram{
  background: #3f729b;
}
.bg-whatsapp{
  background: #43d854;
  color:white;
}
.bg-youtube {
  background: #FF0000;
}
.bg-tiktok {
  background: black;
}

{#/*============================================================================
  #Media queries
==============================================================================*/#}

{# /* // Max width 767px */ #}

@media (max-width: 767px){

    {# /* //// Colors and fonts */ #}

    {# /* Texts */ #}

    {# /* Headings */ #}

    .title-container h1{
        font-size: 24px;
    }
    
    .h1-xs {
        font-size: 36px;
    }
    .h2-xs {
        font-size: 30px;
    }
    .h3-xs {
        font-size: 24px;
    }
    .h4-xs {
        font-size: 18px;
    }
    .h5-xs {
      font-size: 14px;
    }
    .h6-xs {
        font-size: 12px;
    }

    {# /* Body */ #}
    
    .font-body-xs {
        font-size: 14px;
    }
    .font-small-xs {
      font-size: 12px;
    }
    .font-small-extra-xs {
        font-size: 10px;
    } 

    {# /* Weight */ #}

    .weight-normal-xs {
        font-weight: 400;
    }
    .weight-strong-xs {
        font-weight: 700;
    }
    .weight-light-xs {
        font-weight: 100;
    }

    {# /* //// Components */ #}

    {# /* Wrappers */ #}

    .backdrop{
        background: rgba($main-background, .9);
    }

    {# /* Buttons and links */ #}

    .btn-circle{
        width: 50px;
        height: 50px;
        i{
            font-size: 24px;
        }
    }

    .btn-floating-sticky {
        position: sticky;
        z-index: 9;
        top: 10px;
    }

    .btn-module {
        color: $main-foreground;
        border-radius: 0;
        &:hover
        &:focus{
            color: $main-foreground;
        }
        &-icon{
            fill:$accent-color;
        }
    }
    .link-module{
        border-top: 1px solid rgba($main-foreground, .2); 
    }
    
    {# /* Modals */ #}

    .modal-xs{
        background: darken($main-background, 2%);
        &.sheet-bottom {
           background-color: transparent;
        }
        .sheet-bottom-body {
            background-color:$main-background; 
        }
        .modal-xs-header{
            background-color:rgba($main-foreground, .04);
            color: $primary-color;
            &.sheet-bottom-header{
                background-color:darken($main-background, 2%);
                &:active{
                    background-color:darken($main-background, 2%);
                    color: $main-foreground;
                }
            }
            &-icon{
                font-size: 30px;
                color:$primary-color;
                fill:$primary-color;
            }
            &:active{
                background-color:$primary-color;
                color:$main-background;
                .modal-xs-header-icon{
                    color:$main-background;
                    fill:$main-background;
                }
            }
        }
        &-footer {
            border:0;
        }
    }

    .modal-xs-list-item{
        color: rgba($main-foreground, .8);
        border-bottom: 1px solid rgba($main-foreground, .25);
        &.darker{
            background-color:rgba($main-foreground, 0.02);
        }
        .modal-xs-list-icon{
            fill:$primary-color;
        }
        .icon-checked{
            display: none;
        }
        .icon-unchecked{
          display: block;
        }
        &:active{
            background-color:$primary-color;
            color:$main-background;
            .modal-xs-list-icon{
                color:$main-background;
                fill:$main-background;
            }
        }
        &.selected{
            color: $main-background;
            border-right: 0;
            border-left: 0;
            border-bottom: 0;
            background: $primary-color;
            .modal-xs-radio-icon {
                color: $main-background;
                fill: $main-background;
            }
            .icon-checked{
                display: block;
            }
            .icon-unchecked{
              display: none;
            }
        }
        .modal-xs-radio-icon {
            color: $primary-color;
            fill: $primary-color;
        }
    }

    .material-card-xs{
        background-color:$main-background;
    }

    {# /* //// Header and nav */ #}

    {# /* // Nav mobile */ #}

    .navbar-header {
        background-color: $foreground-btn;
        color: $primary-color;
    }

    .mobile-nav{
        .mobile-page-title{
            font-family: $logo-font;
        }
        &-tab.selected{
            border-bottom: none;
        }
        &-tab-text,
        &-tab-icon{
            color:$foreground-btn;
            color:$foreground-btn;
        }
    }
    .mobile-nav-tabs-container {
        border-top: 1px solid #2a2a2a;
        border-bottom: 1px solid #2a2a2a;
        border-left: none;
        border-right: none;
        box-sizing: border-box;
        overflow: hidden;
        width: 100%;
        .mobile-nav-tab {
            border: none;
            box-sizing: border-box;
            padding-top: 12px !important;
            padding-bottom: 12px !important;
            line-height: 1.2;
            & + .mobile-nav-tab {
                border-left: 1px solid #2a2a2a;
            }
            &.selected {
                border-bottom: none;
            }
        }
    }

    .nav-main.mobile-nav,
    .js-main-navbar.nav-main {
        padding-top: 0 !important;
        padding-bottom: 0 !important;
    }

    .category-title-row {
        flex-direction: column !important;
        align-items: stretch !important;
        padding: 14px 15px 0 !important;
        margin-bottom: 10px !important;
        gap: 12px;

        .breadcrumb-product {
            display: block;
            width: 100%;
        }
        .breadcrumb {
            margin: 0 !important;
            padding: 0 !important;
            float: none;
        }
        .category-controls {
            width: 100% !important;
            float: none !important;
            margin: 0 !important;
            padding: 0 !important;
            text-align: left;
        }
        .sort-by-container,
        .sort-by {
            width: 100%;
        }
    }
    .mobile-nav-first-row {
        background-color: #070707;
        color: $primary-color;
        .nav-icon{
            color:#FFFFFF;
            fill:#FFFFFF;
        }
        .btn-hamburger {
        background-color: #070707;
            .nav-icon {
                fill: #FFFFFF;
            }
        }
    }

    .mobile-nav-fixed-bottom {
        background: $main-background;
    }
    
    .mobile-nav-categories-container{
        background-color: $main-background;
        box-shadow: 2px 0px 1px 1px rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
    }

    
    
    .hamburger-panel{
        background-color:$main-background;
        color:$main-foreground;
        fill:$main-foreground;
        &-first-row{
            background-color:rgba($main-foreground, 0.05);
        }
        &-accordion{
            background:rgba($main-foreground, 0.05);
        }
        &-link{
            color:$main-foreground;
            border-bottom: 1px solid rgba($main-foreground, .2);
        }
        .mobile-accounts,
        .mobile-accounts a {
            text-transform: uppercase;
            letter-spacing: 0.04em;
            font-weight: 700 !important;
        }
    }

    .account-links,
    .account-links .nav-top-link,
    .account-links .nav-top-item > a {
        text-transform: uppercase;
        letter-spacing: 0.04em;
        font-weight: 700 !important;
    }

    .mobile-accounts,
    .mobile-accounts a {
        text-transform: uppercase;
        letter-spacing: 0.04em;
        font-weight: 700 !important;
    }

    {# /* //// Product grid */ #}

    {# /* Paginator */ #}

    .pagination .pagination-icon{
        color:$primary-color;
        fill:$primary-color;
    }

    {# /* //// Product detail */ #}

    .product-breadcrumb,
    .product-breadcrumb .breadcrumb-crumb,
    .product-name{
        color: $main-foreground !important;
    }

    .quantity{
        border-top: 1px solid rgba($main-foreground, .2);
        border-bottom: 1px solid rgba($main-foreground, .2);
        &-no-border{
            border: 0; 
        }
    }
 
}
