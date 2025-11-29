
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
    background-color: #070707;
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
    color: white;
    font-family: $body-font;
    {% if settings.background_pattern %}
        background-image: url( "{{ ("images/patterns/" ~ settings.background_pattern ~ ".png") | static_url }}" );
    {% else %}
        background-color: #070707;
    {% endif %}
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
    background: transparent;
    width: 100%;
    padding: 10px 0;
    margin-left: 15px;
    margin-top: 20px;
  &-crumb{
    color: white;
    &.active{
        color: white;
    }
  }
}

.product-breadcrumb .breadcrumb-crumb,
.product-breadcrumb .breadcrumb-crumb.current {
    color:white; /* Necesary for contrast with background image */
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
    &:hover{
        background-color: #1E1E1E;
        color: white;
    }
    &:focus,
    &:active,
    &:active:hover{
        background-color: #1E1E1E;
        color: white;
    }
    &[disabled],
    &[disabled]:hover{
        background-color: #DDD;
        color:$main-background;
        fill:$main-background;
        border-color: #DDD;
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

.item{
    &-image-container{
        background-color:darken($main-background, 2%);
    }
    &-price,
    &-price-compare{
         color:$primary-color;
     }
    &-info-container{
        background-color: $main-background;
       
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


{#/*============================================================================
  #Cart page
==============================================================================*/#}

{# /* // Cart table */ #}

.cart-table{
    background-color: $main-background;
    &-row{
        border-bottom: 1px solid rgba($main-foreground, .2);
    }
    &-header{
        background-color:rgba($main-foreground, .02);
    }
}


{# /* // Ajax cart */ #}

.ajax-cart-container{
    background: darken($main-background, 2%); 
}

{# /* // Totals */ #}

.cart-total,
.total-promotions-row{
    color: $primary-color;
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

    .mobile-nav{
        .mobile-page-title{
            font-family: $logo-font;
        }
        &-tab.selected{
            border-bottom: 3px solid $main-background;
        }
        &-tab-text,
        &-tab-icon{
            color:$foreground-btn;
            color:$foreground-btn;
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