{% if store.allows_checkout_styling %}

{#/*============================================================================
checkout.scss.tpl

    -This file contains all the theme styles related to the checkout based on settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        -static/css/custom-styles.scss.tpl --> For color and font styles related to config/settings.txt
        -static/css/style.scss.tpl --> For the rest of the theme styles

==============================================================================*/#}

{#/*============================================================================
  Global
==============================================================================*/#}

{# /* // Colors */ #}

$primary-brand-color: {{ settings.primary_brand_color | default('rgb(77, 190, 207)' | raw ) }};
$accent-brand-color: {{ settings.accent_brand_color | default('rgb(77, 190, 207)' | raw ) }};
$foreground-color: {{ settings.text_color | default('rgb(102, 102, 102)' | raw ) }};
$background-color: {{ settings.background_color | default('rgb(252, 252, 252)' | raw ) }};

{# /* // Font */ #}

$heading-font: {{ settings.font_headings | default('Roboto') | raw }};
$body-font: {{ settings.font_rest | default('Roboto') | raw }};
$logo-font: {{ settings.font_logo | default('Roboto') | raw }};

{# /* // Box */ #}
$box-radius: 6px;
$box-background: lighten($background-color, 5%);

$box-border-color: rgba($foreground-color, .6);
$box-background: lighten($background-color, 10%);
$box-shadow: null;
@if lightness($background-color) > 50% {
  $box-shadow: 0 0 4px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .2);
} @else {
  $box-shadow: 0 0 4px 0 rgba(0, 0, 0, .2), 0 1px 2px 0 rgba(0, 0, 0, .3);
}
$form-control-radius: 0;

{# /* // Functions */ #}

@function set-background-color($background-color) {
  @if lightness($background-color) > 95% {
    @return lighten($background-color, 10%);
  } @else {
    @return desaturate(lighten($background-color, 7%), 5%);
  }
}

@function set-input-color($background-color, $foreground-color) {
  @if lightness($background-color) > 70% {
    @return desaturate(lighten($foreground-color, 5%), 80%);
  } @else {
    @return desaturate(lighten($background-color, 5%), 80%);
  }
}

{#/*============================================================================
  React
==============================================================================*/#}

{# /* // Box */ #}

$box-background: lighten($background-color, 10%);
$box-text-shadow: null;
@if lightness($foreground-color) > 95% {
  $box-text-shadow: 0 2px 1px rgba(darken($foreground-color, 80%), 0.1);
} @else {
  $box-text-shadow: 0 2px 1px rgba(lighten($foreground-color, 80%), 0.1);
}

$base-red: #c13a3a;

$xs: 0;
$sm: 576px;
$md: 768px;
$lg: 992px;
$xl: 1200px;

body {
  font-family: $body-font;
  color: $foreground-color;
  background-color: darken($background-color, 2%);
}
a {
  color: darken($accent-brand-color, 5%);
  text-decoration: none;

  &:hover, &:focus {
    color: darken($accent-brand-color, 20%);

    svg {
      fill: darken($accent-brand-color, 20%);
    }
  }

  svg {
    fill: darken($accent-brand-color, 5%);
  }
}

{# /* // Text */ #}

.title {
  color: $foreground-color;
}

{# /* // Header */ #}

.header { 
  background-color: lighten($background-color, 10%);
  border-color: $accent-brand-color;
}
.security-seal {
  font-size: 10px;
  color: $foreground-color;
}

{# /* // Headbar */ #}

.headbar {
  background: lighten($background-color, 4%);
  box-shadow: none;

  .row {
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;

    .col.text-left {
      text-align: center !important;
      -ms-flex: 0 0 50%;
      flex: 0 0 50%;
      max-width: 50%;
      margin-left: 25%;
    }
    .col.text-right {
      -ms-flex: 0 0 25%;
      flex: 0 0 25%;
      max-width: 25%;
    }
  }
}

.headbar-logo-img {
  max-width: 100%;
  max-height: 80px;
}

.headbar-logo-text {
  float: none;
  font-family: $logo-font;
  font-size: 36px;
  font-weight: 400;
  color: $primary-brand-color;

  &:hover {
    color: $foreground-color;
  }
}

.headbar-continue {
  margin: 0 !important;
  font-weight: 400;
  &-icon {
    margin-left: 5px;
  }
}

{# /* // Form */ #}

.form-control {
  color: $foreground-color;
  background: $background-color;
  border: $form-control-radius;
  border-bottom: 2px solid $box-border-color;
  border-radius: $form-control-radius;

  &:focus {
    border: 0;
    border-bottom: 2px solid $accent-brand-color;
    outline: none;    
  }
}
.form-options-content {
  font-size: 10px;
  line-height: 20px;
  color: rgba($foreground-color, .6);
  border: 0;
}
.form-group {
  margin-bottom: 15px;

  &-error .form-control {
    border-color: $base-red;

    &:focus {
      border-color: $base-red;
    }
  }
}
.form-group input[type="radio"] + .form-options-content .unchecked {
  fill: darken($background-color, 10%);
}
.form-group input[type="radio"] + .form-options-content .checked {
  fill: $accent-brand-color;
}
.form-group input[type="radio"]:checked + .form-options-content {
  border: 1px solid $accent-brand-color;
  border-color: darken($background-color, 10%);
  
  + .form-options-accordion {
    border-color: darken($background-color, 10%);
  }
  
  .checked {
    fill: $accent-brand-color;
  }
}
.form-group input[type="checkbox"]:checked + .form-options-content .checked {
  fill: $foreground-color;
}
.form-group input[disabled] + .form-options-content {
  border-color: darken($background-color, 10%) !important;
  
  .form-options-label {
    color: $foreground-color !important;
  }
  .checked {
    fill: $foreground-color !important;
  }
}
.form-group input[type="checkbox"] + .form-options-content .unchecked {
  width: 13px;
  fill: $foreground-color;
}

{# /* // Input */ #}
.has-float-label>span,
.has-float-label label {
  padding: 1px 0 0 7px;
  font-weight: 400;
}

.input-label {
  color: $foreground-color;
}

.select-icon {
  fill: $foreground-color;
}

{# /* // Buttons */ #}

.btn-primary {
  color: $background-color;
  background: $accent-brand-color;

  &:hover,
  &:focus,
  &:active {
    color: $background-color;
    background: $accent-brand-color;
    opacity: 0.9;
  }
}
.btn-secondary {
  background: darken($background-color, 5%);
  color: $foreground-color;
  border-color: darken($background-color, 12%);
  border-radius: $form-control-radius;

  &:hover,
  &:focus,
  &:active,
  &:active:focus {
    background: $background-color;
    color: lighten($accent-brand-color, 15%);
    border-color: lighten($accent-brand-color, 15%);
  }
  &.btn-icon-right svg {
    fill: $foreground-color;
  }
}
.btn-transparent {
  font-size: 12px;
  color: rgba($foreground-color, .6);
  text-transform: uppercase;

  &:hover {
    color: $accent-brand-color;
    
    &.btn-icon-right svg {
      fill: $accent-brand-color;
    }
  }
  
  &.btn-icon-right svg {
    fill: rgba($foreground-color, .6);
  }
}

.btn-link {
  color: $foreground-color;
  text-decoration: none;

  &:hover {
    color: $accent-brand-color;

    svg {
      fill: $accent-brand-color;
    }
  }
}

.btn-picker {
  border-color: $box-border-color;
  border-radius: $box-radius;
}

.login-info {
  margin: 10px 0 0;
  font-size: 10px;
  color: rgba($foreground-color, .6);
  text-align: left;
}

{# /* // Breadcrumb */ #}

.breadcrumb li:last-child .breadcrumb-step {
  border-radius: $box-radius;
}

.breadcrumb li .breadcrumb-step {
  margin: 0;
  font-size: 10px;
  color: rgba($foreground-color, .6);
  background: none;
  text-transform: none;

  &.active {
    color: $accent-brand-color;
    background: none;

    &:before,
    &:after {
      position: relative;
      margin: 0 10px;
      color: $foreground-color;
      border: 0;
      content: "/";
      opacity: .6;
    }
  }

  &.visited {
    color: rgba($foreground-color, .6);
    background: none;
  }
}
.breadcrumb li:first-child .breadcrumb-step,
.breadcrumb li:last-child .breadcrumb-step {
  padding: 0;
}

{# /* // Accordion */ #}

.accordion {
  color: $foreground-color;
  background-color: $background-color;
  border-radius: $box-radius;
  border: 0;
  box-shadow: $box-shadow;
}

.accordion-section-header-icon {
  fill: $foreground-color;
}

.accordion-rotate-icon {
  fill: $foreground-color;
}

{# /* // Summary */ #}

.mobile-discount-coupon_btn {
  border-radius: $box-radius;
  border-color: darken($background-color, 10%);
  color: lighten($foreground-color, 20%);

  .icon {
    color: lighten($foreground-color, 20%);
  }
}
.summary-details {
  background: lighten($background-color, 15%);
}
.summary-container {
  background: darken($background-color, 2%);
  border-bottom: 1px solid rgba($foreground-color, .1);
  box-shadow: none;
}
.summary-total {
  padding: 3px 0; 
  font-size: 16px;
  font-weight: 700;
  color: $accent-brand-color;
  background: none;
}
.summary-img-thumb {
  border-radius: 0;
}
.summary-arrow-rounded {
  background: none;
  border: 1px solid $foreground-color;
  .summary-arrow-icon {
    fill: $foreground-color;
  }
}
.summary-title {
  color: $foreground-color;
}

{# /* // Radio */ #}

.radio-group.radio-group-accordion {
  border-color: rgba($foreground-color, .1);
  box-shadow: $box-shadow;
  overflow: hidden;

  .radio {
    border-color: rgba($foreground-color, .1);

    &.active {
      margin: 0;
      padding-bottom: 10px;
      color: $accent-brand-color;
      background: $background-color;
      border: 0;
      border-bottom: none;
      .label {
        padding-bottom: 15px;
        color: $accent-brand-color;
        border-bottom: 1px solid rgba($foreground-color, .1);
      }
      & + .radio-content {
        padding-top: 5px;
        border-top: none;
        border-bottom: 1px solid rgba($foreground-color, .1)
      }
      .payment-item-discount {
        color: $accent-brand-color;
      }
    }
    .label {
      font-size: 16px;
      font-weight: 700;
      color: rgba($foreground-color, .6);
    }
    .description {
      width: calc(100% - 35px);
      margin-left: 35px;
      font-weight: 400;
    }
  }
}

.radio input:checked + .selector:before {
  background-image: radial-gradient(circle, $accent-brand-color 0%, $accent-brand-color 40%, transparent 50%, transparent 100%);
  border-color: $accent-brand-color;
}
.radio input:disabled:checked + .selector:before {
  background-image: radial-gradient(circle, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.5) 50%, transparent 50%, transparent 100%);
}
.radio .selector:before {
  width: 20px;
  height: 20px;
  margin: 1px 15px 0 0;
  border: 2px solid rgba($foreground-color, 0.6);
}

.radio-content {
  background: $background-color;
  border: 0;
  box-shadow: none;
}
.shipping-option {
  margin: 0;
  border: 0;
  border-bottom: 1px solid rgba($foreground-color, .1);
  border-radius: 0;

  &.active {
    border-color: rgba($foreground-color, .1);
    background: $background-color;
    .shipping-method-item-price,
    .shipping-method-item-desc {
      color: $accent-brand-color;
    }
  }
}

{# /* // Panel */ #}

.panel {
  padding: 0;
  color: $foreground-color;
  background: none;
  text-align: left;
  border-radius: $box-radius;
  box-shadow: none;
  border: 0;

  &.panel-with-header {
    padding-top: 0;
    p {
      margin: 0 0 25px 0;
    }
  }
  &.summary-details {
    background: darken($background-color, 2%);
    border-radius: $box-radius;
    box-shadow: $box-shadow;
  }
  .panel-subheader:before {
    display: inline-block;
    width: 25px;
    margin: 0 10px 0 0;
    vertical-align: middle;
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23{{ settings.text_color |trim('#') }}"><path d="M8 8c0-2.2 1.8-4 4-4s4 1.8 4 4s-1.8 4-4 4S8 10.2 8 8z M12 14c-2.7 0-8 1.3-8 4v2h16v-2C20 15.3 14.7 14 12 14z"/></svg>');
  }
  .panel-submodule:last-child .panel-subheader:before,
  .shipping-options .panel-subheader:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23{{ settings.text_color |trim('#') }}"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>');
  }
  .new-shipping-flow .panel-subheader-ship:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400" fill="%23{{ settings.text_color |trim('#') }}"><path d="M226.8 94.6H0V63.8h242.2c8.5 0 15.4 6.9 15.4 15.4v41.6h70.1c4.7 0 9.1 2.1 12 5.8l57 71.2c2.2 2.7 3.4 6.1 3.4 9.6v85.5c0 8.5-6.9 15.4-15.4 15.4h-30.1c-6.2 16.6-22.3 28.5-41.1 28.5-24.2 0-43.9-19.6-43.9-43.9 0-24.2 19.6-43.9 43.9-43.9 18.8 0 34.9 11.8 41.1 28.5h14.7v-64.7l-49-61.2h-62.7v141.3c0 8.5-6.9 15.4-15.4 15.4h-85.5v-30.8h70.1V94.6zm-70.1 56.9H28.5v-30.8h128.2v30.8zm-28.5 57H0v-30.8h128.2v30.8zm-42.7 71.2c-7.2 0-13.1 5.9-13.1 13.1 0 7.2 5.9 13.1 13.1 13.1 7.2 0 13.1-5.9 13.1-13.1 0-7.2-5.9-13.1-13.1-13.1zm-43.9 13.2c0-24.2 19.6-43.9 43.9-43.9s43.9 19.6 43.9 43.9c0 24.2-19.6 43.9-43.9 43.9s-43.9-19.7-43.9-43.9zm271.8-13.2c-7.2 0-13.1 5.9-13.1 13.1 0 7.2 5.9 13.1 13.1 13.1 7.2 0 13.1-5.9 13.1-13.1 0-7.2-5.9-13.1-13.1-13.1z"/></svg>');
  }
  .new-shipping-flow .panel-subheader-pickup:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400" fill="%23{{ settings.text_color |trim('#') }}"><path d="M198.3 0c-82.5 0-150 67.5-150 150 0 60 20 77.5 135 242.5 3.8 5 9.4 7.5 15 7.5s11.3-2.5 15-7.5c115-165 135-182.5 135-242.5 0-82.5-67.5-150-150-150zm0 348.5c-11.3-16.1-21.5-30.6-30.8-43.7C93.9 200.4 85.8 187.7 85.8 150c0-62 50.5-112.5 112.5-112.5S310.8 88 310.8 150c0 37.7-8.1 50.4-81.7 154.8-9.3 13.1-19.5 27.6-30.8 43.7z"/></svg>');
  }
  .shipping-address-container .panel-subheader:before {
    display: none;
  }
}
.panel-header {
  margin: 0;
  font-family: $heading-font;
  font-size: 24px;
  font-weight: 400;
  color: $foreground-color;
  background-color: darken($background-color, 2%);
  text-align: left;
  border: 0;
  text-shadow: none;
}
.panel-header-sticky {
  background-color: darken($background-color, 2%);
}
.panel-footer {
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
  background: darken($background-color, 2%);
  &-wa {
    border-color: darken($background-color, 5%);
  }
}
.panel-footer-form {
  input {
    border-color: $foreground-color;
  }
  .input-group-addon {
    background: $background-color;
    border-color: $foreground-color;
  }
  .disabled {
    background: darken($background-color, 15%) !important;
  }
}


{# /* // Table */ #}

.table-footer {
  display: block;
  margin-top: 15px;
  font-size: 22px;
  font-weight: 700;
  color: $accent-brand-color;
  border-top: 1px solid rgba($foreground-color, 0.1);

  .text-semi-bold {
    font-weight: 400;
  }
}

.table-subtotal {
  padding: 15px 0 0;
  margin: 0;
  border-color: rgba($foreground-color, 0.1);
  border-width: 1px;

  td {
    padding: 3px 0;
  }
  .table tr {
    display: block;
    padding: 0 15px;
  }
  .table-footer td {
    padding: 15px 0;
  }
}

.table.table-scrollable {
  padding: 0;

  tr {
    border-bottom: 1px solid rgba($foreground-color, 0.1);
    &:last-child {
      border: 0;
    }
  }
  td {
    padding: 15px 0;
  }
  .summary-img-wrap {
    padding: 15px;
  }
  .table-price {
    padding-right: 15px;
  }
}
.table .table-discount-coupon,
.table .table-discount-promotion {
  color: $accent-brand-color;
  border: 0;
}


{# /* // shipping options */ #}

.shipping-options {
  color: lighten($foreground-color, 7%);

  .radio-group {
    border-radius: $box-radius;
    box-shadow: $box-shadow;
    overflow: hidden;
  }

  .btn {
    margin: 0;
  }
}

.shipping-options-ship, 
.shipping-options-pickup {
  border-radius: $box-radius;
  box-shadow: $box-shadow;
  overflow: hidden;
}

.new-shipping-flow .shipping-options .radio-group {
  box-shadow: none;
  overflow: inherit;
}

.shipping-method-item > span {
  width: 100%;
}

.shipping-method-item-desc,
.shipping-method-item-name {
  max-width: 70%;
  color: desaturate(lighten($foreground-color, 5%), 80%)
}

.shipping-method-item-price {
  float: right;
  font-size: 18px;
  color: rgba($foreground-color, .6);
}

.price-striked {
  display: block;
  margin: 5px 0 0 !important;
  font-size: 14px;
  color: rgba($foreground-color, .6);
  text-align: right;
}

{# /* // Discount Coupon */ #}

.box-discount-coupon button {
  color: $foreground-color;
  background: none;

  &:hover {
    background: none;
  }
  svg {
    width: 20px;
    fill: $accent-brand-color;
  }
}

.box-discount-coupon-applied {
  color: $foreground-color;
  background-color: $background-color;
  border: 0;
  border-radius: 0;

  .coupon-icon {
    fill: $foreground-color;
  }
}

{# /* // Order Status */ #}

.orderstatus {
  border: 1px solid rgba($foreground-color, .1); 
  box-shadow: $box-shadow;
}

{# /* // Destination */ #}

.destination {
  border-color: rgba($foreground-color, 0.1);
  &-icon svg {
    fill: $accent-brand-color;
  }
}

{# /* // User Detail */ #}

.user-detail-icon svg {
  fill: $accent-brand-color;
}

{# /* // History */ #}

.history-item-done .history-item-title {
  color: $accent-brand-color;
}
.history-item-failure .history-item-title {
  color: $base-red;
}
.history-item-progress-icon svg {
  @if lightness($background-color) > 50% {
    fill: darken($background-color, 10%);  
  } @else {
    fill: $background-color;
  }
}
.history-item-progress-icon:after {
  @if lightness($background-color) > 50% {
    fill: darken($background-color, 10%);
    border-color: darken($background-color, 10%);
  } @else {
    fill: $background-color;
    border-color: $background-color;
  }
}
.history-item-progress-icon-failure svg {
  fill: $base-red;
}
.history-item-progress-icon-success svg {
  fill: $accent-brand-color;
}
.history-item-progress-icon-success:after {
  border-color: $accent-brand-color;
}

{# /* // History Cancelled */ #}

.history-canceled {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  
  &-round {
    border-bottom-right-radius: $box-radius;
    border-bottom-left-radius: $box-radius;
  }
}
.history-canceled-header {
  border-color: rgba($box-border-color, 0.7);
  border-top-left-radius: $box-radius;
  border-top-right-radius: $box-radius;
}
.history-canceled-icon svg {
  fill: darken($background-color, 45%);
}

{# /* // Offline Payment */ #}

.ticket-coupon {
  background: darken($background-color, 4%);
  border-color: $box-border-color;
}

{# /* // Status */ #}

.status {
  border: 1px solid rgba($foreground-color, .1); 
  box-shadow: $box-shadow;
  padding: 25px 0;
  &-icon svg {
    fill: $accent-brand-color;
  }
}

{# /* // Tracking */ #}

.tracking-item-time {
  color: $foreground-color;
}

{# /* // WhatsApp Opt-in */ #}

.whatsapp-form input, 
.whatsapp-form .input-group-addon {
  border-color: $accent-brand-color;
}

{# /* // Helpers */ #}

.border-top {
  border-color: rgba($box-border-color, .4);
}

{# /* // Errors */ #}
.alert-danger-bagged {
  margin: 0;
  padding-top: 6px;
  border-bottom-left-radius: $form-control-radius;
  border-bottom-right-radius: $form-control-radius;
}

.general-error {
  background: $base-red;
  border-color: lighten($base-red, 10%);
}

{# /* // Badge */ #}

.badge {
  border: 0;
}

{# /* // Payment */ #}

.payment-item-discount {
  color: $accent-brand-color;
}

.payment-option {
  border-radius: $box-radius;
  color: $foreground-color;
  background-color: $background-color;
  border: 0;
  box-shadow: $box-shadow;
}

.radio-content.payment-option-content {
  background: darken($background-color, 2%);
  border: 1px solid rgba($foreground-color, .15);
  border-top: 0;
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
}

{# /* // Overlay */ #}

.overlay {
  background: rgba(darken($background-color, 10%), 0.6);
}
.overlay-title {
  color: rgba($foreground-color, .7);
}

{# /* // List Picker */ #}

.list-picker .unchecked {
  fill: $foreground-color;
}
.list-picker li {
  border-color: $box-border-color;
  background: lighten($background-color, 10%);

  &:hover {
    color: $accent-brand-color;
  }

  &.active {
    background: $background-color;
    color: $accent-brand-color;

    .checked {
      fill: $accent-brand-color;
    }
  }
}

.list-picker-content {
  background: lighten($background-color, 10%);
  border-color: $box-border-color;
}

{# /* // Loading */ #}

.loading {
  background: rgba(darken($background-color, 2%), 0.5);
  color: $accent-brand-color;
}
.loading-spinner {
  color: $accent-brand-color;
}
.loading-skeleton {
  float: left;
  width: 100%;
  border: 1px solid rgba($foreground-color, .1);
  border-radius: $box-radius;
  &-radio {
    margin: 0;
    border: 0;
    border-bottom: 1px solid rgba($foreground-color, .1);
    border-radius: 0;
  }
}

{# /* // Spinner */ #}

.round-spinner {
  border-color: $accent-brand-color;
  border-left-color: darken($accent-brand-color, 5%);
  
  &:after {
    border-color: $accent-brand-color;
    border-left-color: darken($accent-brand-color, 5%);
  }
}

.spinner > .spinner-elem {
  background: $accent-brand-color;
}

.spinner-inverted > .spinner-elem {
  background: $background-color;
}

{# /* // Sign Up */ #}

.signup {
  padding: 25px 0;
  border: 1px solid rgba($foreground-color, .1); 
  box-shadow: $box-shadow;
  &-icon svg {
    fill: $accent-brand-color;
  }
}

{# /* // Modal */ #}

.modal-dialog {
  background: $background-color;
}

{# /* // List */ #}

.list-group-item {
  border-color: rgba($foreground-color, .1);
}

{# /* // Announcement */ #}

.announcement {
  color: darken($primary-brand-color, 10%);

  &-bg {
    background: $primary-brand-color;
    box-shadow: 0px 3px 5px -1px rgba(darken($primary-brand-color, 20%), 0.35);
    border-radius: $box-radius;
  }

  &-close {
    color: $primary-brand-color;
  }
}

{# /* // Alert */ #}

.alert-info {
  background-color: transparent;
  border-color: transparent;
  color: white;

  .alert-icon {
    fill: desaturate(darken($accent-brand-color, 10%), 20%);
  }
}

{# /* // Chip */ #}

.chip {
  background-color: rgba($accent-brand-color, .15);
  color: desaturate(darken($accent-brand-color, 10%), 30%);
}

{# /* // Review Block Detailed  */ #}
.price--display__free {
  color: $accent-brand-color;
}

.review-block-detailed-item {
  border-bottom: 1px solid rgba($foreground-color, .15);
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
  &:last-child {
    border-radius: 0 0 $box-radius $box-radius;
  }
}

.review-block-detailed {
  border: 1px solid rgba($foreground-color, .15);
  border-radius: $box-radius;
  background-color: $background-color;
  box-shadow: $box-shadow;
}

{# /* // Tooltip */ #}

.tooltip-icon {
  fill: $foreground-color;
}

{# /* // Tabs */ #}

.tabs-wrapper {
  background: $background-color;
  border-bottom-color: darken($background-color, 10%);
}

.tab-item.active {
  color: $accent-brand-color;
  font-weight: bold;
}

.tab-indicator {
  background-color: $primary-brand-color;
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}

{# /* // Max width 576px */ #}

@media (max-width: $sm) {

  .security-seal {
    color: #000000;

    .d-inline-block:first-child {
      position: absolute;
      top: 1px;
      left: 50%;
      margin-left: -13px;
    }
    p {
      display: inline-block;
      &.text-semi-bold {
        margin-right: 50px !important;
      }
    }
    &-badge {
      margin: 0;
    }
  }

  .headbar .row .col {
    text-align: center !important;
    flex-basis: auto;
  }

  .headbar .row .col.text-left {
    -ms-flex: 0 0 100%;
    flex: 0 0 100%;
    max-width: 100%;
    margin-left: 0;
    order: 2;
  }

  .headbar .row .col.text-right {
    -ms-flex: 0 0 100%;
    flex: 0 0 100%;
    max-width: 100%;
    margin: -12px 0 15px 0;
    background: #aac67b;
  }

  .summary .panel {
    border: 0;
  }

  .panel-header {
    font-size: 22px;
  }

  .table.table-scrollable td {
    padding: 15px;
  }

  .orderstatus-footer {
    background: $background-color;
  }

}

{# /* // Min width 768px */ #}

@media (min-width: $md) {

  .status,
  .signup {
    padding: 40px 0;
  }

}

{# /* // Max width 0px */ #}

@media (max-width: $xs) {

  .modal-xs {
    background: $background-color;
  }

}

{% endif %}
