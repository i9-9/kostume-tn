{% raw %}@charset "UTF-8":

{#/*============================================================================
critical-css.tpl

    -This file contains all the theme critical styles wich will be loaded inline before the rest of the site
    -Rest of styling can be found in:
      -static/css/style.scss.tpl --> For non critical styles witch will be loaded asynchronously
        -static/css/custom-styles.scss.tpl --> For color and font styles related to config/settings.txt
        -static/checkout.scss.tpl --> For color and font styles related to config/settings.txt applied on the checkout

==============================================================================*/#}

{# /*============================================================================
  Table of Contents

  #External CSS libraries and plugins
    // Bootstrap v3.3.6
    // Swiper 4.4.2
  #Critical path utilities classes
  #Components
    // Animations
    // Placeholders and preloaders
    // Buttons and links
    // Icons
    // Modals
    // Alerts and notifications
    // Pills
    // Breadcrumbs
    // Forms
    // Banners
    // Sliders
    // Images
    // Video
  #Header and nav
    // Nav desktop
    // Nav mobile
    // Logo
  #Product grid
    // Category image
    // Filters and categories
    // Grid item
    // Labels
  #Product detail
    // Header
    // Image
    // Variants
    // Payments
  #Cart detail
  #Media queries
    // Max width 767px
      //// Components
      //// Header and nav
      //// Product grid
      //// Product detail
  #Utilities classes

==============================================================================*/ #}

{#/*============================================================================
  #External CSS libraries and plugins
==============================================================================*/#}

{# /* // Critical part of Bootstrap v3.3.6 */ #}

html{font-family:sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}body{margin:0}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}*:before,*:after{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}html{font-size:10px;-webkit-tap-highlight-color:rgba(0,0,0,0)}body{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;line-height:1.42857143;color:#333;background-color:#fff}input,button,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit}a{color:#337ab7;text-decoration:none}a:hover,a:focus{color:#23527c;text-decoration:underline}a:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}figure{margin:0}img{vertical-align:middle}.img-responsive,.thumbnail>img,.thumbnail a>img,.carousel-inner>.item>img,.carousel-inner>.item>a>img{display:block;max-width:100%;height:auto}.img-rounded{border-radius:6px}.img-thumbnail{display:inline-block;max-width:100%;height:auto;padding:4px;line-height:1.42857143;background-color:#fff;border:1px solid #ddd;border-radius:4px;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;transition:all .2s ease-in-out}.img-circle{border-radius:50%}hr{margin-top:20px;margin-bottom:20px;border:0;border-top:1px solid #eee}.sr-only{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}.sr-only-focusable:active,.sr-only-focusable:focus{position:static;width:auto;height:auto;margin:0;overflow:visible;clip:auto}[role="button"]{cursor:pointer}h1,h2,h3,h4,h5,h6,.h1,.h2,.h3,.h4,.h5,.h6{font-family:inherit;font-weight:500;line-height:1.1;color:inherit}h1{margin:.67em 0;font-size:2em}h1 small,h2 small,h3 small,h4 small,h5 small,h6 small,.h1 small,.h2 small,.h3 small,.h4 small,.h5 small,.h6 small,h1 .small,h2 .small,h3 .small,h4 .small,h5 .small,h6 .small,.h1 .small,.h2 .small,.h3 .small,.h4 .small,.h5 .small,.h6 .small{font-weight:400;line-height:1;color:#777}h1,.h1,h2,.h2,h3,.h3{margin-top:20px;margin-bottom:10px}h1 small,.h1 small,h2 small,.h2 small,h3 small,.h3 small,h1 .small,.h1 .small,h2 .small,.h2 .small,h3 .small,.h3 .small{font-size:65%}h4,.h4,h5,.h5,h6,.h6{margin-top:10px;margin-bottom:10px}h4 small,.h4 small,h5 small,.h5 small,h6 small,.h6 small,h4 .small,.h4 .small,h5 .small,.h5 .small,h6 .small,.h6 .small{font-size:75%}h1,.h1{font-size:36px}h2,.h2{font-size:30px}h3,.h3{font-size:24px}h4,.h4{font-size:18px}h5,.h5{font-size:14px}h6,.h6{font-size:12px}p{margin:0 0 10px}.lead{margin-bottom:20px;font-size:16px;font-weight:300;line-height:1.4}@media (min-width:768px){.lead{font-size:21px}}small,.small{font-size:85%}mark,.mark{padding:.2em;background-color:#fcf8e3}.text-left{text-align:left}.text-right{text-align:right}.text-center{text-align:center}.text-justify{text-align:justify}.text-nowrap{white-space:nowrap}.text-lowercase{text-transform:lowercase}.text-uppercase{text-transform:uppercase}.text-capitalize{text-transform:capitalize}.text-muted{color:#777}.text-primary{color:#337ab7}ul,ol{margin-top:0;margin-bottom:10px}ul ul,ol ul,ul ol,ol ol{margin-bottom:0}.list-unstyled{padding-left:0;list-style:none}.list-inline{padding-left:0;margin-left:-5px;list-style:none}.list-inline>li{display:inline-block;padding-right:5px;padding-left:5px}.container{padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto}@media (min-width:768px){.container{width:750px}}@media (min-width:992px){.container{width:970px}}@media (min-width:1200px){.container{width:1170px}}.container-fluid{margin-right:auto;margin-left:auto}.col-xs-1,.col-sm-1,.col-md-1,.col-lg-1,.col-xs-2,.col-sm-2,.col-md-2,.col-lg-2,.col-xs-3,.col-sm-3,.col-md-3,.col-lg-3,.col-xs-4,.col-sm-4,.col-md-4,.col-lg-4,.col-xs-5,.col-sm-5,.col-md-5,.col-lg-5,.col-xs-6,.col-sm-6,.col-md-6,.col-lg-6,.col-xs-7,.col-sm-7,.col-md-7,.col-lg-7,.col-xs-8,.col-sm-8,.col-md-8,.col-lg-8,.col-xs-9,.col-sm-9,.col-md-9,.col-lg-9,.col-xs-10,.col-sm-10,.col-md-10,.col-lg-10,.col-xs-11,.col-sm-11,.col-md-11,.col-lg-11,.col-xs-12,.col-sm-12,.col-md-12,.col-lg-12{position:relative;min-height:1px;padding-right:15px;padding-left:15px}.col-xs-1,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,.col-xs-6,.col-xs-7,.col-xs-8,.col-xs-9,.col-xs-10,.col-xs-11,.col-xs-12{float:left}.col-xs-12{width:100%}.col-xs-11{width:91.66666667%}.col-xs-10{width:83.33333333%}.col-xs-9{width:75%}.col-xs-8{width:66.66666667%}.col-xs-7{width:58.33333333%}.col-xs-6{width:50%}.col-xs-5{width:41.66666667%}.col-xs-4{width:33.33333333%}.col-xs-3{width:25%}.col-xs-2{width:16.66666667%}.col-xs-1{width:8.33333333%}.col-xs-pull-12{right:100%}.col-xs-pull-11{right:91.66666667%}.col-xs-pull-10{right:83.33333333%}.col-xs-pull-9{right:75%}.col-xs-pull-8{right:66.66666667%}.col-xs-pull-7{right:58.33333333%}.col-xs-pull-6{right:50%}.col-xs-pull-5{right:41.66666667%}.col-xs-pull-4{right:33.33333333%}.col-xs-pull-3{right:25%}.col-xs-pull-2{right:16.66666667%}.col-xs-pull-1{right:8.33333333%}.col-xs-pull-0{right:auto}.col-xs-push-12{left:100%}.col-xs-push-11{left:91.66666667%}.col-xs-push-10{left:83.33333333%}.col-xs-push-9{left:75%}.col-xs-push-8{left:66.66666667%}.col-xs-push-7{left:58.33333333%}.col-xs-push-6{left:50%}.col-xs-push-5{left:41.66666667%}.col-xs-push-4{left:33.33333333%}.col-xs-push-3{left:25%}.col-xs-push-2{left:16.66666667%}.col-xs-push-1{left:8.33333333%}.col-xs-push-0{left:auto}.col-xs-offset-12{margin-left:100%}.col-xs-offset-11{margin-left:91.66666667%}.col-xs-offset-10{margin-left:83.33333333%}.col-xs-offset-9{margin-left:75%}.col-xs-offset-8{margin-left:66.66666667%}.col-xs-offset-7{margin-left:58.33333333%}.col-xs-offset-6{margin-left:50%}.col-xs-offset-5{margin-left:41.66666667%}.col-xs-offset-4{margin-left:33.33333333%}.col-xs-offset-3{margin-left:25%}.col-xs-offset-2{margin-left:16.66666667%}.col-xs-offset-1{margin-left:8.33333333%}.col-xs-offset-0{margin-left:0}@media (min-width:768px){.col-sm-1,.col-sm-2,.col-sm-3,.col-sm-4,.col-sm-5,.col-sm-6,.col-sm-7,.col-sm-8,.col-sm-9,.col-sm-10,.col-sm-11,.col-sm-12{float:left}.col-sm-12{width:100%}.col-sm-11{width:91.66666667%}.col-sm-10{width:83.33333333%}.col-sm-9{width:75%}.col-sm-8{width:66.66666667%}.col-sm-7{width:58.33333333%}.col-sm-6{width:50%}.col-sm-5{width:41.66666667%}.col-sm-4{width:33.33333333%}.col-sm-3{width:25%}.col-sm-2{width:16.66666667%}.col-sm-1{width:8.33333333%}.col-sm-pull-12{right:100%}.col-sm-pull-11{right:91.66666667%}.col-sm-pull-10{right:83.33333333%}.col-sm-pull-9{right:75%}.col-sm-pull-8{right:66.66666667%}.col-sm-pull-7{right:58.33333333%}.col-sm-pull-6{right:50%}.col-sm-pull-5{right:41.66666667%}.col-sm-pull-4{right:33.33333333%}.col-sm-pull-3{right:25%}.col-sm-pull-2{right:16.66666667%}.col-sm-pull-1{right:8.33333333%}.col-sm-pull-0{right:auto}.col-sm-push-12{left:100%}.col-sm-push-11{left:91.66666667%}.col-sm-push-10{left:83.33333333%}.col-sm-push-9{left:75%}.col-sm-push-8{left:66.66666667%}.col-sm-push-7{left:58.33333333%}.col-sm-push-6{left:50%}.col-sm-push-5{left:41.66666667%}.col-sm-push-4{left:33.33333333%}.col-sm-push-3{left:25%}.col-sm-push-2{left:16.66666667%}.col-sm-push-1{left:8.33333333%}.col-sm-push-0{left:auto}.col-sm-offset-12{margin-left:100%}.col-sm-offset-11{margin-left:91.66666667%}.col-sm-offset-10{margin-left:83.33333333%}.col-sm-offset-9{margin-left:75%}.col-sm-offset-8{margin-left:66.66666667%}.col-sm-offset-7{margin-left:58.33333333%}.col-sm-offset-6{margin-left:50%}.col-sm-offset-5{margin-left:41.66666667%}.col-sm-offset-4{margin-left:33.33333333%}.col-sm-offset-3{margin-left:25%}.col-sm-offset-2{margin-left:16.66666667%}.col-sm-offset-1{margin-left:8.33333333%}.col-sm-offset-0{margin-left:0}}@media (min-width:992px){.col-md-1,.col-md-2,.col-md-3,.col-md-4,.col-md-5,.col-md-6,.col-md-7,.col-md-8,.col-md-9,.col-md-10,.col-md-11,.col-md-12{float:left}.col-md-12{width:100%}.col-md-11{width:91.66666667%}.col-md-10{width:83.33333333%}.col-md-9{width:75%}.col-md-8{width:66.66666667%}.col-md-7{width:58.33333333%}.col-md-6{width:50%}.col-md-5{width:41.66666667%}.col-md-4{width:33.33333333%}.col-md-3{width:25%}.col-md-2{width:16.66666667%}.col-md-1{width:8.33333333%}.col-md-pull-12{right:100%}.col-md-pull-11{right:91.66666667%}.col-md-pull-10{right:83.33333333%}.col-md-pull-9{right:75%}.col-md-pull-8{right:66.66666667%}.col-md-pull-7{right:58.33333333%}.col-md-pull-6{right:50%}.col-md-pull-5{right:41.66666667%}.col-md-pull-4{right:33.33333333%}.col-md-pull-3{right:25%}.col-md-pull-2{right:16.66666667%}.col-md-pull-1{right:8.33333333%}.col-md-pull-0{right:auto}.col-md-push-12{left:100%}.col-md-push-11{left:91.66666667%}.col-md-push-10{left:83.33333333%}.col-md-push-9{left:75%}.col-md-push-8{left:66.66666667%}.col-md-push-7{left:58.33333333%}.col-md-push-6{left:50%}.col-md-push-5{left:41.66666667%}.col-md-push-4{left:33.33333333%}.col-md-push-3{left:25%}.col-md-push-2{left:16.66666667%}.col-md-push-1{left:8.33333333%}.col-md-push-0{left:auto}.col-md-offset-12{margin-left:100%}.col-md-offset-11{margin-left:91.66666667%}.col-md-offset-10{margin-left:83.33333333%}.col-md-offset-9{margin-left:75%}.col-md-offset-8{margin-left:66.66666667%}.col-md-offset-7{margin-left:58.33333333%}.col-md-offset-6{margin-left:50%}.col-md-offset-5{margin-left:41.66666667%}.col-md-offset-4{margin-left:33.33333333%}.col-md-offset-3{margin-left:25%}.col-md-offset-2{margin-left:16.66666667%}.col-md-offset-1{margin-left:8.33333333%}.col-md-offset-0{margin-left:0}}@media (min-width:1200px){.col-lg-1,.col-lg-2,.col-lg-3,.col-lg-4,.col-lg-5,.col-lg-6,.col-lg-7,.col-lg-8,.col-lg-9,.col-lg-10,.col-lg-11,.col-lg-12{float:left}.col-lg-12{width:100%}.col-lg-11{width:91.66666667%}.col-lg-10{width:83.33333333%}.col-lg-9{width:75%}.col-lg-8{width:66.66666667%}.col-lg-7{width:58.33333333%}.col-lg-6{width:50%}.col-lg-5{width:41.66666667%}.col-lg-4{width:33.33333333%}.col-lg-3{width:25%}.col-lg-2{width:16.66666667%}.col-lg-1{width:8.33333333%}.col-lg-pull-12{right:100%}.col-lg-pull-11{right:91.66666667%}.col-lg-pull-10{right:83.33333333%}.col-lg-pull-9{right:75%}.col-lg-pull-8{right:66.66666667%}.col-lg-pull-7{right:58.33333333%}.col-lg-pull-6{right:50%}.col-lg-pull-5{right:41.66666667%}.col-lg-pull-4{right:33.33333333%}.col-lg-pull-3{right:25%}.col-lg-pull-2{right:16.66666667%}.col-lg-pull-1{right:8.33333333%}.col-lg-pull-0{right:auto}.col-lg-push-12{left:100%}.col-lg-push-11{left:91.66666667%}.col-lg-push-10{left:83.33333333%}.col-lg-push-9{left:75%}.col-lg-push-8{left:66.66666667%}.col-lg-push-7{left:58.33333333%}.col-lg-push-6{left:50%}.col-lg-push-5{left:41.66666667%}.col-lg-push-4{left:33.33333333%}.col-lg-push-3{left:25%}.col-lg-push-2{left:16.66666667%}.col-lg-push-1{left:8.33333333%}.col-lg-push-0{left:auto}.col-lg-offset-12{margin-left:100%}.col-lg-offset-11{margin-left:91.66666667%}.col-lg-offset-10{margin-left:83.33333333%}.col-lg-offset-9{margin-left:75%}.col-lg-offset-8{margin-left:66.66666667%}.col-lg-offset-7{margin-left:58.33333333%}.col-lg-offset-6{margin-left:50%}.col-lg-offset-5{margin-left:41.66666667%}.col-lg-offset-4{margin-left:33.33333333%}.col-lg-offset-3{margin-left:25%}.col-lg-offset-2{margin-left:16.66666667%}.col-lg-offset-1{margin-left:8.33333333%}.col-lg-offset-0{margin-left:0}}.btn{display:inline-block;padding:6px 12px;margin-bottom:0;font-size:14px;font-weight:400;line-height:1.42857143;text-align:center;white-space:nowrap;vertical-align:middle;-ms-touch-action:manipulation;touch-action:manipulation;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-image:none;border:1px solid transparent;border-radius:4px}.btn:focus,.btn:active:focus,.btn.active:focus,.btn.focus,.btn:active.focus,.btn.active.focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}.btn:hover,.btn:focus,.btn.focus{color:#333;text-decoration:none}.btn:active,.btn.active{background-image:none;outline:0;-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);box-shadow:inset 0 3px 5px rgba(0,0,0,.125)}.btn.disabled,.btn[disabled],fieldset[disabled] .btn{cursor:not-allowed;filter:alpha(opacity=65);-webkit-box-shadow:none;box-shadow:none;opacity:.65}a.btn.disabled,fieldset[disabled] a.btn{pointer-events:none}.btn-default{color:#333;background-color:#fff;border-color:#ccc}.btn-default:focus,.btn-default.focus{color:#333;background-color:#e6e6e6;border-color:#8c8c8c}.btn-default:hover{color:#333;background-color:#e6e6e6;border-color:#adadad}.btn-default:active,.btn-default.active,.open>.dropdown-toggle.btn-default{color:#333;background-color:#e6e6e6;border-color:#adadad}.btn-default:active:hover,.btn-default.active:hover,.open>.dropdown-toggle.btn-default:hover,.btn-default:active:focus,.btn-default.active:focus,.open>.dropdown-toggle.btn-default:focus,.btn-default:active.focus,.btn-default.active.focus,.open>.dropdown-toggle.btn-default.focus{color:#333;background-color:#d4d4d4;border-color:#8c8c8c}.btn-default:active,.btn-default.active,.open>.dropdown-toggle.btn-default{background-image:none}.btn-default.disabled:hover,.btn-default[disabled]:hover,fieldset[disabled] .btn-default:hover,.btn-default.disabled:focus,.btn-default[disabled]:focus,fieldset[disabled] .btn-default:focus,.btn-default.disabled.focus,.btn-default[disabled].focus,fieldset[disabled] .btn-default.focus{background-color:#fff;border-color:#ccc}.btn-default .badge{color:#fff;background-color:#333}.btn-primary{color:#fff;background-color:#337ab7;border-color:#2e6da4}.btn-primary:focus,.btn-primary.focus{color:#fff;background-color:#286090;border-color:#122b40}.btn-primary:hover{color:#fff;background-color:#286090;border-color:#204d74}.btn-primary:active,.btn-primary.active,.open>.dropdown-toggle.btn-primary{color:#fff;background-color:#286090;border-color:#204d74}.btn-primary:active:hover,.btn-primary.active:hover,.open>.dropdown-toggle.btn-primary:hover,.btn-primary:active:focus,.btn-primary.active:focus,.open>.dropdown-toggle.btn-primary:focus,.btn-primary:active.focus,.btn-primary.active.focus,.open>.dropdown-toggle.btn-primary.focus{color:#fff;background-color:#204d74;border-color:#122b40}.btn-primary:active,.btn-primary.active,.open>.dropdown-toggle.btn-primary{background-image:none}.btn-primary.disabled:hover,.btn-primary[disabled]:hover,fieldset[disabled] .btn-primary:hover,.btn-primary.disabled:focus,.btn-primary[disabled]:focus,fieldset[disabled] .btn-primary:focus,.btn-primary.disabled.focus,.btn-primary[disabled].focus,fieldset[disabled] .btn-primary.focus{background-color:#337ab7;border-color:#2e6da4}.btn-primary .badge{color:#337ab7;background-color:#fff}.btn-success{color:#fff;background-color:#5cb85c;border-color:#4cae4c}.btn-success:focus,.btn-success.focus{color:#fff;background-color:#449d44;border-color:#255625}.btn-success:hover{color:#fff;background-color:#449d44;border-color:#398439}.btn-success:active,.btn-success.active,.open>.dropdown-toggle.btn-success{color:#fff;background-color:#449d44;border-color:#398439}.btn-success:active:hover,.btn-success.active:hover,.open>.dropdown-toggle.btn-success:hover,.btn-success:active:focus,.btn-success.active:focus,.open>.dropdown-toggle.btn-success:focus,.btn-success:active.focus,.btn-success.active.focus,.open>.dropdown-toggle.btn-success.focus{color:#fff;background-color:#398439;border-color:#255625}.btn-success:active,.btn-success.active,.open>.dropdown-toggle.btn-success{background-image:none}.btn-success.disabled:hover,.btn-success[disabled]:hover,fieldset[disabled] .btn-success:hover,.btn-success.disabled:focus,.btn-success[disabled]:focus,fieldset[disabled] .btn-success:focus,.btn-success.disabled.focus,.btn-success[disabled].focus,fieldset[disabled] .btn-success.focus{background-color:#5cb85c;border-color:#4cae4c}.btn-success .badge{color:#5cb85c;background-color:#fff}.btn-info{color:#fff;background-color:#5bc0de;border-color:#46b8da}.btn-info:focus,.btn-info.focus{color:#fff;background-color:#31b0d5;border-color:#1b6d85}.btn-info:hover{color:#fff;background-color:#31b0d5;border-color:#269abc}.btn-info:active,.btn-info.active,.open>.dropdown-toggle.btn-info{color:#fff;background-color:#31b0d5;border-color:#269abc}.btn-info:active:hover,.btn-info.active:hover,.open>.dropdown-toggle.btn-info:hover,.btn-info:active:focus,.btn-info.active:focus,.open>.dropdown-toggle.btn-info:focus,.btn-info:active.focus,.btn-info.active.focus,.open>.dropdown-toggle.btn-info.focus{color:#fff;background-color:#269abc;border-color:#1b6d85}.btn-info:active,.btn-info.active,.open>.dropdown-toggle.btn-info{background-image:none}.btn-info.disabled:hover,.btn-info[disabled]:hover,fieldset[disabled] .btn-info:hover,.btn-info.disabled:focus,.btn-info[disabled]:focus,fieldset[disabled] .btn-info:focus,.btn-info.disabled.focus,.btn-info[disabled].focus,fieldset[disabled] .btn-info.focus{background-color:#5bc0de;border-color:#46b8da}.btn-info .badge{color:#5bc0de;background-color:#fff}.btn-warning{color:#fff;background-color:#f0ad4e;border-color:#eea236}.btn-warning:focus,.btn-warning.focus{color:#fff;background-color:#ec971f;border-color:#985f0d}.btn-warning:hover{color:#fff;background-color:#ec971f;border-color:#d58512}.btn-warning:active,.btn-warning.active,.open>.dropdown-toggle.btn-warning{color:#fff;background-color:#ec971f;border-color:#d58512}.btn-warning:active:hover,.btn-warning.active:hover,.open>.dropdown-toggle.btn-warning:hover,.btn-warning:active:focus,.btn-warning.active:focus,.open>.dropdown-toggle.btn-warning:focus,.btn-warning:active.focus,.btn-warning.active.focus,.open>.dropdown-toggle.btn-warning.focus{color:#fff;background-color:#d58512;border-color:#985f0d}.btn-warning:active,.btn-warning.active,.open>.dropdown-toggle.btn-warning{background-image:none}.btn-warning.disabled:hover,.btn-warning[disabled]:hover,fieldset[disabled] .btn-warning:hover,.btn-warning.disabled:focus,.btn-warning[disabled]:focus,fieldset[disabled] .btn-warning:focus,.btn-warning.disabled.focus,.btn-warning[disabled].focus,fieldset[disabled] .btn-warning.focus{background-color:#f0ad4e;border-color:#eea236}.btn-warning .badge{color:#f0ad4e;background-color:#fff}.btn-danger{color:#fff;background-color:#d9534f;border-color:#d43f3a}.btn-danger:focus,.btn-danger.focus{color:#fff;background-color:#c9302c;border-color:#761c19}.btn-danger:hover{color:#fff;background-color:#c9302c;border-color:#ac2925}.btn-danger:active,.btn-danger.active,.open>.dropdown-toggle.btn-danger{color:#fff;background-color:#c9302c;border-color:#ac2925}.btn-danger:active:hover,.btn-danger.active:hover,.open>.dropdown-toggle.btn-danger:hover,.btn-danger:active:focus,.btn-danger.active:focus,.open>.dropdown-toggle.btn-danger:focus,.btn-danger:active.focus,.btn-danger.active.focus,.open>.dropdown-toggle.btn-danger.focus{color:#fff;background-color:#ac2925;border-color:#761c19}.btn-danger:active,.btn-danger.active,.open>.dropdown-toggle.btn-danger{background-image:none}.btn-danger.disabled:hover,.btn-danger[disabled]:hover,fieldset[disabled] .btn-danger:hover,.btn-danger.disabled:focus,.btn-danger[disabled]:focus,fieldset[disabled] .btn-danger:focus,.btn-danger.disabled.focus,.btn-danger[disabled].focus,fieldset[disabled] .btn-danger.focus{background-color:#d9534f;border-color:#d43f3a}.btn-danger .badge{color:#d9534f;background-color:#fff}.btn-link{font-weight:400;color:#337ab7;border-radius:0}.btn-link,.btn-link:active,.btn-link.active,.btn-link[disabled],fieldset[disabled] .btn-link{background-color:transparent;-webkit-box-shadow:none;box-shadow:none}.btn-link,.btn-link:hover,.btn-link:focus,.btn-link:active{border-color:transparent}.btn-link:hover,.btn-link:focus{color:#23527c;text-decoration:underline;background-color:transparent}.btn-link[disabled]:hover,fieldset[disabled] .btn-link:hover,.btn-link[disabled]:focus,fieldset[disabled] .btn-link:focus{color:#777;text-decoration:none}.btn-lg,.btn-group-lg>.btn{padding:10px 16px;font-size:18px;line-height:1.3333333;border-radius:6px}.btn-sm,.btn-group-sm>.btn{padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}.btn-xs,.btn-group-xs>.btn{padding:1px 5px;font-size:12px;line-height:1.5;border-radius:3px}.btn-block{display:block;width:100%}.btn-block + .btn-block{margin-top:5px}input[type="submit"].btn-block,input[type="reset"].btn-block,input[type="button"].btn-block{width:100%}.fade{opacity:0;-webkit-transition:opacity .15s linear;-o-transition:opacity .15s linear;transition:opacity .15s linear}.fade.in{opacity:1}.dropup,.dropdown{position:relative}.dropdown-toggle:focus{outline:0}.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;font-size:14px;text-align:left;list-style:none;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0,0,0,.15);border-radius:4px;-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175);box-shadow:0 6px 12px rgba(0,0,0,.175)}.dropdown-menu.pull-right{right:0;left:auto}.dropdown-menu .divider{height:1px;margin:9px 0;overflow:hidden;background-color:#e5e5e5}.dropdown-menu>li>a{display:block;padding:3px 20px;clear:both;font-weight:400;line-height:1.42857143;color:#333;white-space:nowrap}.dropdown-menu>li>a:hover,.dropdown-menu>li>a:focus{color:#262626;text-decoration:none;background-color:#f5f5f5}.dropdown-menu>.active>a,.dropdown-menu>.active>a:hover,.dropdown-menu>.active>a:focus{color:#fff;text-decoration:none;background-color:#337ab7;outline:0}.dropdown-menu>.disabled>a,.dropdown-menu>.disabled>a:hover,.dropdown-menu>.disabled>a:focus{color:#777}.dropdown-menu>.disabled>a:hover,.dropdown-menu>.disabled>a:focus{text-decoration:none;cursor:not-allowed;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.open>.dropdown-menu{display:block}.open>a{outline:0}.dropdown-menu-right{right:0;left:auto}.dropdown-menu-left{right:auto;left:0}.dropdown-header{display:block;padding:3px 20px;font-size:12px;line-height:1.42857143;color:#777;white-space:nowrap}.dropdown-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:990}.pull-right>.dropdown-menu{right:0;left:auto}.dropup .caret,.navbar-fixed-bottom .dropdown .caret{content:"";border-top:0;border-bottom:4px dashed;border-bottom:4px solid \9}.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:2px}@media (min-width:768px){.navbar-right .dropdown-menu{right:0;left:auto}.navbar-right .dropdown-menu-left{right:auto;left:0}}.nav{padding-left:0;margin-bottom:0;list-style:none}.nav>li{position:relative;display:block}.nav>li>a{position:relative;display:block;padding:10px 15px}.nav>li>a:hover,.nav>li>a:focus{text-decoration:none;background-color:#eee}.nav>li.disabled>a{color:#777}.nav>li.disabled>a:hover,.nav>li.disabled>a:focus{color:#777;text-decoration:none;cursor:not-allowed;background-color:transparent}.nav .open>a,.nav .open>a:hover,.nav .open>a:focus{background-color:#eee;border-color:#337ab7}.nav .nav-divider{height:1px;margin:9px 0;overflow:hidden;background-color:#e5e5e5}.nav>li>a>img{max-width:none}.navbar{position:relative;min-height:50px;margin-bottom:20px;border:1px solid transparent}@media (min-width:768px){.navbar{border-radius:4px}}@media (min-width:768px){.navbar-header{float:left}}.navbar{position:relative;min-height:50px;margin-bottom:20px;border:1px solid transparent}@media (min-width:768px){.navbar{border-radius:4px}}@media (min-width:768px){.navbar-header{float:left}}.navbar-collapse{padding-right:15px;padding-left:15px;overflow-x:visible;-webkit-overflow-scrolling:touch;border-top:1px solid transparent;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1);box-shadow:inset 0 1px 0 rgba(255,255,255,.1)}.navbar-collapse.in{overflow-y:auto}@media (min-width:768px){.navbar-collapse{width:auto;border-top:0;-webkit-box-shadow:none;box-shadow:none}.navbar-collapse.collapse{display:block!important;height:auto!important;padding-bottom:0;overflow:visible!important}.navbar-collapse.in{overflow-y:visible}.navbar-fixed-top .navbar-collapse,.navbar-static-top .navbar-collapse,.navbar-fixed-bottom .navbar-collapse{padding-right:0;padding-left:0}}.navbar-fixed-top .navbar-collapse,.navbar-fixed-bottom .navbar-collapse{max-height:340px}@media (max-device-width:480px) and (orientation:landscape){.navbar-fixed-top .navbar-collapse,.navbar-fixed-bottom .navbar-collapse{max-height:200px}}.container>.navbar-header,.container-fluid>.navbar-header,.container>.navbar-collapse,.container-fluid>.navbar-collapse{margin-right:-15px;margin-left:-15px}@media (min-width:768px){.container>.navbar-header,.container-fluid>.navbar-header,.container>.navbar-collapse,.container-fluid>.navbar-collapse{margin-right:0;margin-left:0}}.navbar-static-top{z-index:1000;border-width:0 0 1px}@media (min-width:768px){.navbar-static-top{border-radius:0}}.navbar-fixed-top,.navbar-fixed-bottom{position:fixed;right:0;left:0;z-index:1030}@media (min-width:768px){.navbar-fixed-top,.navbar-fixed-bottom{border-radius:0}}.navbar-fixed-top{top:0;border-width:0 0 1px}.navbar-fixed-bottom{bottom:0;margin-bottom:0;border-width:1px 0 0}.navbar-brand{float:left;height:50px;padding:15px 15px;font-size:18px;line-height:20px}.navbar-brand:hover,.navbar-brand:focus{text-decoration:none}.navbar-brand>img{display:block}@media (min-width:768px){.navbar>.container .navbar-brand,.navbar>.container-fluid .navbar-brand{margin-left:-15px}}.navbar-toggle{position:relative;float:right;padding:9px 10px;margin-top:8px;margin-right:15px;margin-bottom:8px;background-color:transparent;background-image:none;border:1px solid transparent;border-radius:4px}.navbar-toggle:focus{outline:0}.navbar-toggle .icon-bar{display:block;width:22px;height:2px;border-radius:1px}.navbar-toggle .icon-bar + .icon-bar{margin-top:4px}@media (min-width:768px){.navbar-toggle{display:none}}.navbar-nav{margin:7.5px -15px}.navbar-nav>li>a{padding-top:10px;padding-bottom:10px;line-height:20px}@media (max-width:767px){.navbar-nav .open .dropdown-menu{position:static;float:none;width:auto;margin-top:0;background-color:transparent;border:0;-webkit-box-shadow:none;box-shadow:none}.navbar-nav .open .dropdown-menu>li>a,.navbar-nav .open .dropdown-menu .dropdown-header{padding:5px 15px 5px 25px}.navbar-nav .open .dropdown-menu>li>a{line-height:20px}.navbar-nav .open .dropdown-menu>li>a:hover,.navbar-nav .open .dropdown-menu>li>a:focus{background-image:none}}@media (min-width:768px){.navbar-nav{float:left;margin:0}.navbar-nav>li{float:left}.navbar-nav>li>a{padding-top:15px;padding-bottom:15px}}.navbar-form{padding:10px 15px;margin-top:8px;margin-right:-15px;margin-bottom:8px;margin-left:-15px;border-top:1px solid transparent;border-bottom:1px solid transparent;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1);box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1)}@media (min-width:768px){.navbar-form .form-group{display:inline-block;margin-bottom:0;vertical-align:middle}.navbar-form .form-control{display:inline-block;width:auto;vertical-align:middle}.navbar-form .form-control-static{display:inline-block}.navbar-form .input-group{display:inline-table;vertical-align:middle}.navbar-form .input-group .input-group-addon,.navbar-form .input-group .input-group-btn,.navbar-form .input-group .form-control{width:auto}.navbar-form .input-group>.form-control{width:100%}.navbar-form .control-label{margin-bottom:0;vertical-align:middle}.navbar-form .radio,.navbar-form .checkbox{display:inline-block;margin-top:0;margin-bottom:0;vertical-align:middle}.navbar-form .radio label,.navbar-form .checkbox label{padding-left:0}.navbar-form .radio input[type="radio"],.navbar-form .checkbox input[type="checkbox"]{position:relative;margin-left:0}.navbar-form .has-feedback .form-control-feedback{top:0}}@media (max-width:767px){.navbar-form .form-group{margin-bottom:5px}.navbar-form .form-group:last-child{margin-bottom:0}}@media (min-width:768px){.navbar-form{width:auto;padding-top:0;padding-bottom:0;margin-right:0;margin-left:0;border:0;-webkit-box-shadow:none;box-shadow:none}}.navbar-nav>li>.dropdown-menu{margin-top:0;border-top-left-radius:0;border-top-right-radius:0}.navbar-fixed-bottom .navbar-nav>li>.dropdown-menu{margin-bottom:0;border-top-left-radius:4px;border-top-right-radius:4px;border-bottom-right-radius:0;border-bottom-left-radius:0}.navbar-btn{margin-top:8px;margin-bottom:8px}.navbar-btn.btn-sm{margin-top:10px;margin-bottom:10px}.navbar-btn.btn-xs{margin-top:14px;margin-bottom:14px}.navbar-text{margin-top:15px;margin-bottom:15px}@media (min-width:768px){.navbar-text{float:left;margin-right:15px;margin-left:15px}}@media (min-width:768px){.navbar-left{float:left!important}.navbar-right{float:right!important;margin-right:-15px}.navbar-right~.navbar-right{margin-right:0}}.navbar-default{background-color:#f8f8f8;border-color:#e7e7e7}.navbar-default .navbar-brand{color:#777}.navbar-default .navbar-brand:hover,.navbar-default .navbar-brand:focus{color:#5e5e5e;background-color:transparent}.navbar-default .navbar-text{color:#777}.navbar-default .navbar-nav>li>a{color:#777}.navbar-default .navbar-nav>li>a:hover,.navbar-default .navbar-nav>li>a:focus{color:#333;background-color:transparent}.navbar-default .navbar-nav>.active>a,.navbar-default .navbar-nav>.active>a:hover,.navbar-default .navbar-nav>.active>a:focus{color:#555;background-color:#e7e7e7}.navbar-default .navbar-nav>.disabled>a,.navbar-default .navbar-nav>.disabled>a:hover,.navbar-default .navbar-nav>.disabled>a:focus{color:#ccc;background-color:transparent}.navbar-default .navbar-toggle{border-color:#ddd}.navbar-default .navbar-toggle:hover,.navbar-default .navbar-toggle:focus{background-color:#ddd}.navbar-default .navbar-toggle .icon-bar{background-color:#888}.navbar-default .navbar-collapse,.navbar-default .navbar-form{border-color:#e7e7e7}.navbar-default .navbar-nav>.open>a,.navbar-default .navbar-nav>.open>a:hover,.navbar-default .navbar-nav>.open>a:focus{color:#555;background-color:#e7e7e7}@media (max-width:767px){.navbar-default .navbar-nav .open .dropdown-menu>li>a{color:#777}.navbar-default .navbar-nav .open .dropdown-menu>li>a:hover,.navbar-default .navbar-nav .open .dropdown-menu>li>a:focus{color:#333;background-color:transparent}.navbar-default .navbar-nav .open .dropdown-menu>.active>a,.navbar-default .navbar-nav .open .dropdown-menu>.active>a:hover,.navbar-default .navbar-nav .open .dropdown-menu>.active>a:focus{color:#555;background-color:#e7e7e7}.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a,.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a:hover,.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a:focus{color:#ccc;background-color:transparent}}.navbar-default .navbar-link{color:#777}.navbar-default .navbar-link:hover{color:#333}.navbar-default .btn-link{color:#777}.navbar-default .btn-link:hover,.navbar-default .btn-link:focus{color:#333}.navbar-default .btn-link[disabled]:hover,fieldset[disabled] .navbar-default .btn-link:hover,.navbar-default .btn-link[disabled]:focus,fieldset[disabled] .navbar-default .btn-link:focus{color:#ccc}.navbar-inverse{background-color:#222;border-color:#080808}.navbar-inverse .navbar-brand{color:#9d9d9d}.navbar-inverse .navbar-brand:hover,.navbar-inverse .navbar-brand:focus{color:#fff;background-color:transparent}.navbar-inverse .navbar-text{color:#9d9d9d}.navbar-inverse .navbar-nav>li>a{color:#9d9d9d}.navbar-inverse .navbar-nav>li>a:hover,.navbar-inverse .navbar-nav>li>a:focus{color:#fff;background-color:transparent}.navbar-inverse .navbar-nav>.active>a,.navbar-inverse .navbar-nav>.active>a:hover,.navbar-inverse .navbar-nav>.active>a:focus{color:#fff;background-color:#080808}.navbar-inverse .navbar-nav>.disabled>a,.navbar-inverse .navbar-nav>.disabled>a:hover,.navbar-inverse .navbar-nav>.disabled>a:focus{color:#444;background-color:transparent}.navbar-inverse .navbar-toggle{border-color:#333}.navbar-inverse .navbar-toggle:hover,.navbar-inverse .navbar-toggle:focus{background-color:#333}.navbar-inverse .navbar-toggle .icon-bar{background-color:#fff}.navbar-inverse .navbar-collapse,.navbar-inverse .navbar-form{border-color:#101010}.navbar-inverse .navbar-nav>.open>a,.navbar-inverse .navbar-nav>.open>a:hover,.navbar-inverse .navbar-nav>.open>a:focus{color:#fff;background-color:#080808}@media (max-width:767px){.navbar-inverse .navbar-nav .open .dropdown-menu>.dropdown-header{border-color:#080808}.navbar-inverse .navbar-nav .open .dropdown-menu .divider{background-color:#080808}.navbar-inverse .navbar-nav .open .dropdown-menu>li>a{color:#9d9d9d}.navbar-inverse .navbar-nav .open .dropdown-menu>li>a:hover,.navbar-inverse .navbar-nav .open .dropdown-menu>li>a:focus{color:#fff;background-color:transparent}.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a,.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a:hover,.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a:focus{color:#fff;background-color:#080808}.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a,.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a:hover,.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a:focus{color:#444;background-color:transparent}}.navbar-inverse .navbar-link{color:#9d9d9d}.navbar-inverse .navbar-link:hover{color:#fff}.navbar-inverse .btn-link{color:#9d9d9d}.navbar-inverse .btn-link:hover,.navbar-inverse .btn-link:focus{color:#fff}.navbar-inverse .btn-link[disabled]:hover,fieldset[disabled] .navbar-inverse .btn-link:hover,.navbar-inverse .btn-link[disabled]:focus,fieldset[disabled] .navbar-inverse .btn-link:focus{color:#444}.modal-open{overflow:hidden}.modal{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1050;display:none;overflow:hidden;-webkit-overflow-scrolling:touch;outline:0}.modal.fade .modal-dialog{-webkit-transition:-webkit-transform .3s ease-out;-o-transition:-o-transform .3s ease-out;transition:transform .3s ease-out;-webkit-transform:translate(0,-25%);-ms-transform:translate(0,-25%);-o-transform:translate(0,-25%);transform:translate(0,-25%)}.modal.in .modal-dialog{-webkit-transform:translate(0,0);-ms-transform:translate(0,0);-o-transform:translate(0,0);transform:translate(0,0)}.modal-open .modal{overflow-x:hidden;overflow-y:auto}.modal-dialog{position:relative;width:auto;margin:10px}.modal-content{position:relative;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,.2);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,.5);box-shadow:0 3px 9px rgba(0,0,0,.5)}.modal-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;background-color:#000}.modal-backdrop.fade{filter:alpha(opacity=0);opacity:0}.modal-backdrop.in{filter:alpha(opacity=50);opacity:.5}.modal-header{padding:15px;border-bottom:1px solid #e5e5e5}.modal-header .close{margin-top:-2px}.modal-title{margin:0;line-height:1.42857143}.modal-body{position:relative;padding:15px}.modal-footer{padding:15px;text-align:right;border-top:1px solid #e5e5e5}.modal-footer .btn + .btn{margin-bottom:0;margin-left:5px}.modal-footer .btn-group .btn + .btn{margin-left:-1px}.modal-footer .btn-block + .btn-block{margin-left:0}.modal-scrollbar-measure{position:absolute;top:-9999px;width:50px;height:50px;overflow:scroll}@media (min-width:768px){.modal-dialog{width:600px;margin:30px auto}.modal-content{-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}.modal-sm{width:300px}}@media (min-width:992px){.modal-lg{width:900px}}.clearfix:before,.clearfix:after,.dl-horizontal dd:before,.dl-horizontal dd:after,.container:before,.container:after,.container-fluid:before,.container-fluid:after,.row:before,.row:after,.form-horizontal .form-group:before,.form-horizontal .form-group:after,.btn-toolbar:before,.btn-toolbar:after,.btn-group-vertical>.btn-group:before,.btn-group-vertical>.btn-group:after,.nav:before,.nav:after,.navbar:before,.navbar:after,.navbar-header:before,.navbar-header:after,.navbar-collapse:before,.navbar-collapse:after,.pager:before,.pager:after,.panel-body:before,.panel-body:after,.modal-header:before,.modal-header:after,.modal-footer:before,.modal-footer:after{display:table;content:" "}.clearfix:after,.dl-horizontal dd:after,.container:after,.container-fluid:after,.row:after,.form-horizontal .form-group:after,.btn-toolbar:after,.btn-group-vertical>.btn-group:after,.nav:after,.navbar:after,.navbar-header:after,.navbar-collapse:after,.pager:after,.panel-body:after,.modal-header:after,.modal-footer:after{clear:both}.center-block{display:block;margin-right:auto;margin-left:auto}.pull-right{float:right!important}.pull-left{float:left!important}.hide{display:none!important}.show{display:block!important}.invisible{visibility:hidden}.text-hide{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.hidden{display:none!important}.affix{position:fixed}@-ms-viewport{width:device-width}.visible-xs,.visible-sm,.visible-md,.visible-lg{display:none!important}.visible-xs-block,.visible-xs-inline,.visible-xs-inline-block,.visible-sm-block,.visible-sm-inline,.visible-sm-inline-block,.visible-md-block,.visible-md-inline,.visible-md-inline-block,.visible-lg-block,.visible-lg-inline,.visible-lg-inline-block{display:none!important}@media (max-width:767px){.visible-xs{display:block!important}table.visible-xs{display:table!important}tr.visible-xs{display:table-row!important}th.visible-xs,td.visible-xs{display:table-cell!important}}@media (max-width:767px){.visible-xs-block{display:block!important}}@media (max-width:767px){.visible-xs-inline{display:inline!important}}@media (max-width:767px){.visible-xs-inline-block{display:inline-block!important}}@media (min-width:768px) and (max-width:991px){.visible-sm{display:block!important}table.visible-sm{display:table!important}tr.visible-sm{display:table-row!important}th.visible-sm,td.visible-sm{display:table-cell!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-block{display:block!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-inline{display:inline!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-inline-block{display:inline-block!important}}@media (min-width:992px) and (max-width:1199px){.visible-md{display:block!important}table.visible-md{display:table!important}tr.visible-md{display:table-row!important}th.visible-md,td.visible-md{display:table-cell!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-block{display:block!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-inline{display:inline!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-inline-block{display:inline-block!important}}@media (min-width:1200px){.visible-lg{display:block!important}table.visible-lg{display:table!important}tr.visible-lg{display:table-row!important}th.visible-lg,td.visible-lg{display:table-cell!important}}@media (min-width:1200px){.visible-lg-block{display:block!important}}@media (min-width:1200px){.visible-lg-inline{display:inline!important}}@media (min-width:1200px){.visible-lg-inline-block{display:inline-block!important}}@media (max-width:767px){.hidden-xs{display:none!important}}@media (min-width:768px) and (max-width:991px){.hidden-sm{display:none!important}}@media (min-width:992px) and (max-width:1199px){.hidden-md{display:none!important}}@media (min-width:1200px){.hidden-lg{display:none!important}}.visible-print{display:none!important}@media print{.visible-print{display:block!important}table.visible-print{display:table!important}tr.visible-print{display:table-row!important}th.visible-print,td.visible-print{display:table-cell!important}}.visible-print-block{display:none!important}@media print{.visible-print-block{display:block!important}}.visible-print-inline{display:none!important}@media print{.visible-print-inline{display:inline!important}}.visible-print-inline-block{display:none!important}@media print{.visible-print-inline-block{display:inline-block!important}}@media print{.hidden-print{display:none!important}}.breadcrumb{padding:8px 15px;margin-bottom:20px;list-style:none;background-color:#f5f5f5;border-radius:4px}.breadcrumb>li{display:inline-block}.breadcrumb>li + li:before{padding:0 5px;color:#ccc;content:"/\00a0"}.breadcrumb>.active{color:#777}

{# /* // Swiper 4.4.2 */ #}

.swiper-container{width:100%;margin:0 auto;position:relative;overflow:hidden;list-style:none;padding:0;z-index:1}.swiper-container-no-flexbox .swiper-slide{float:left}.swiper-container-vertical>.swiper-wrapper{-webkit-box-orient:vertical;-webkit-box-direction:normal;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column}.swiper-wrapper{position:relative;width:100%;height:100%;z-index:1;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-transition-property:-webkit-transform;transition-property:-webkit-transform;-o-transition-property:transform;transition-property:transform;transition-property:transform,-webkit-transform}.swiper-container-android .swiper-slide,.swiper-wrapper{-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}.swiper-container-multirow>.swiper-wrapper{-webkit-flex-wrap:wrap;-ms-flex-wrap:wrap;flex-wrap:wrap}.swiper-container-free-mode>.swiper-wrapper{-webkit-transition-timing-function:ease-out;-o-transition-timing-function:ease-out;transition-timing-function:ease-out;margin:0 auto}.swiper-slide{-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;width:100%;height:100%;position:relative;-webkit-transition-property:-webkit-transform;transition-property:-webkit-transform;-o-transition-property:transform;transition-property:transform;transition-property:transform,-webkit-transform}.swiper-slide-invisible-blank{visibility:hidden}.swiper-container-autoheight,.swiper-container-autoheight .swiper-slide{height:auto}.swiper-container-autoheight .swiper-wrapper{-webkit-box-align:start;-webkit-align-items:flex-start;-ms-flex-align:start;align-items:flex-start;-webkit-transition-property:height,-webkit-transform;transition-property:height,-webkit-transform;-o-transition-property:transform,height;transition-property:transform,height;transition-property:transform,height,-webkit-transform}.swiper-container-3d{-webkit-perspective:1200px;perspective:1200px}.swiper-container-3d .swiper-cube-shadow,.swiper-container-3d .swiper-slide,.swiper-container-3d .swiper-slide-shadow-bottom,.swiper-container-3d .swiper-slide-shadow-left,.swiper-container-3d .swiper-slide-shadow-right,.swiper-container-3d .swiper-slide-shadow-top,.swiper-container-3d .swiper-wrapper{-webkit-transform-style:preserve-3d;transform-style:preserve-3d}.swiper-container-3d .swiper-slide-shadow-bottom,.swiper-container-3d .swiper-slide-shadow-left,.swiper-container-3d .swiper-slide-shadow-right,.swiper-container-3d .swiper-slide-shadow-top{position:absolute;left:0;top:0;width:100%;height:100%;pointer-events:none;z-index:10}.swiper-container-3d .swiper-slide-shadow-left{background-image:-webkit-gradient(linear,right top,left top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(right,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(right,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to left,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-3d .swiper-slide-shadow-right{background-image:-webkit-gradient(linear,left top,right top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(left,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(left,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to right,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-3d .swiper-slide-shadow-top{background-image:-webkit-gradient(linear,left bottom,left top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(bottom,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(bottom,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to top,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-3d .swiper-slide-shadow-bottom{background-image:-webkit-gradient(linear,left top,left bottom,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(top,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(top,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to bottom,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-wp8-horizontal,.swiper-container-wp8-horizontal>.swiper-wrapper{-ms-touch-action:pan-y;touch-action:pan-y}.swiper-container-wp8-vertical,.swiper-container-wp8-vertical>.swiper-wrapper{-ms-touch-action:pan-x;touch-action:pan-x}.swiper-button-next,.swiper-button-prev{position:absolute;top:50%;z-index:10;width:30px;height:40px;margin-top:-25px;line-height:40px;color:#fff;text-align:center;cursor:pointer}.swiper-button-next.swiper-button-disabled,.swiper-button-prev.swiper-button-disabled{opacity:0;cursor:auto}.swiper-button-prev,.swiper-container-rtl .swiper-button-next{left:20px;right:auto}.swiper-button-next,.swiper-container-rtl .swiper-button-prev{right:20px;left:auto}.swiper-button-lock{display:none}.swiper-pagination{position:absolute;text-align:center;-webkit-transition:.3s opacity;-o-transition:.3s opacity;transition:.3s opacity;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0);z-index:10}.swiper-pagination.swiper-pagination-hidden{opacity:0}.swiper-container-horizontal>.swiper-pagination-bullets,.swiper-pagination-custom,.swiper-pagination-fraction{bottom:20px;left:0;width:100%}.swiper-pagination-bullets-dynamic{overflow:hidden;font-size:0}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{-webkit-transform:scale(.33);-ms-transform:scale(.33);transform:scale(.33);position:relative}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active{-webkit-transform:scale(1);-ms-transform:scale(1);transform:scale(1)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-main{-webkit-transform:scale(1);-ms-transform:scale(1);transform:scale(1)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-prev{-webkit-transform:scale(.66);-ms-transform:scale(.66);transform:scale(.66)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-prev-prev{-webkit-transform:scale(.33);-ms-transform:scale(.33);transform:scale(.33)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-next{-webkit-transform:scale(.66);-ms-transform:scale(.66);transform:scale(.66)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-next-next{-webkit-transform:scale(.33);-ms-transform:scale(.33);transform:scale(.33)}.swiper-pagination-bullet{width:8px;height:8px;display:inline-block;border-radius:100%;background:#000;opacity:.2}button.swiper-pagination-bullet{border:none;margin:0;padding:0;-webkit-box-shadow:none;box-shadow:none;-webkit-appearance:none;-moz-appearance:none;appearance:none}.swiper-pagination-clickable .swiper-pagination-bullet{cursor:pointer}.swiper-pagination-bullet-active{opacity:1;background:#007aff}.swiper-container-vertical>.swiper-pagination-bullets{right:10px;top:50%;-webkit-transform:translate3d(0,-50%,0);transform:translate3d(0,-50%,0)}.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet{margin:6px 0;display:block}.swiper-container-vertical>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic{top:50%;-webkit-transform:translateY(-50%);-ms-transform:translateY(-50%);transform:translateY(-50%);width:8px}.swiper-container-vertical>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{display:inline-block;-webkit-transition:.2s top,.2s -webkit-transform;transition:.2s top,.2s -webkit-transform;-o-transition:.2s transform,.2s top;transition:.2s transform,.2s top;transition:.2s transform,.2s top,.2s -webkit-transform}.swiper-container-horizontal>.swiper-pagination-bullets .swiper-pagination-bullet{margin:0 4px}.swiper-container-horizontal>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic{left:50%;-webkit-transform:translateX(-50%);-ms-transform:translateX(-50%);transform:translateX(-50%);white-space:nowrap}.swiper-container-horizontal>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{-webkit-transition:.2s left,.2s -webkit-transform;transition:.2s left,.2s -webkit-transform;-o-transition:.2s transform,.2s left;transition:.2s transform,.2s left;transition:.2s transform,.2s left,.2s -webkit-transform}.swiper-container-horizontal.swiper-container-rtl>.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{-webkit-transition:.2s right,.2s -webkit-transform;transition:.2s right,.2s -webkit-transform;-o-transition:.2s transform,.2s right;transition:.2s transform,.2s right;transition:.2s transform,.2s right,.2s -webkit-transform}.swiper-pagination-progressbar{background:rgba(0,0,0,.25);position:absolute}.swiper-pagination-progressbar .swiper-pagination-progressbar-fill{background:#007aff;position:absolute;left:0;top:0;width:100%;height:100%;-webkit-transform:scale(0);-ms-transform:scale(0);transform:scale(0);-webkit-transform-origin:left top;-ms-transform-origin:left top;transform-origin:left top}.swiper-container-rtl .swiper-pagination-progressbar .swiper-pagination-progressbar-fill{-webkit-transform-origin:right top;-ms-transform-origin:right top;transform-origin:right top}.swiper-container-horizontal>.swiper-pagination-progressbar,.swiper-container-vertical>.swiper-pagination-progressbar.swiper-pagination-progressbar-opposite{width:100%;height:4px;left:0;top:0}.swiper-container-horizontal>.swiper-pagination-progressbar.swiper-pagination-progressbar-opposite,.swiper-container-vertical>.swiper-pagination-progressbar{width:4px;height:100%;left:0;top:0}.swiper-pagination-white .swiper-pagination-bullet-active{background:#fff}.swiper-pagination-progressbar.swiper-pagination-white{background:rgba(255,255,255,.25)}.swiper-pagination-progressbar.swiper-pagination-white .swiper-pagination-progressbar-fill{background:#fff}.swiper-pagination-black .swiper-pagination-bullet-active{background:#000}.swiper-pagination-progressbar.swiper-pagination-black{background:rgba(0,0,0,.25)}.swiper-pagination-progressbar.swiper-pagination-black .swiper-pagination-progressbar-fill{background:#000}.swiper-pagination-lock{display:none}.swiper-lazy-preloader{width:42px;height:42px;position:absolute;left:50%;top:50%;margin-left:-21px;margin-top:-21px;z-index:10;-webkit-transform-origin:50%;-ms-transform-origin:50%;transform-origin:50%;-webkit-animation:swiper-preloader-spin 1s steps(12,end) infinite;animation:swiper-preloader-spin 1s steps(12,end) infinite}.swiper-lazy-preloader:after{display:block;content:'';width:100%;height:100%;background-image:url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%236c6c6c'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E");background-position:50%;background-size:100%;background-repeat:no-repeat}.swiper-lazy-preloader-white:after{background-image:url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%23fff'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E")}@-webkit-keyframes swiper-preloader-spin{100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}@keyframes swiper-preloader-spin{100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}.swiper-container-fade.swiper-container-free-mode .swiper-slide{-webkit-transition-timing-function:ease-out;-o-transition-timing-function:ease-out;transition-timing-function:ease-out}.swiper-container-fade .swiper-slide{pointer-events:none;-webkit-transition-property:opacity;-o-transition-property:opacity;transition-property:opacity}.swiper-container-fade .swiper-slide .swiper-slide{pointer-events:none}.swiper-container-fade .swiper-slide-active,.swiper-container-fade .swiper-slide-active .swiper-slide-active{pointer-events:auto}

{#/*============================================================================
  #Critical path utilities classes
==============================================================================*/#}

/* Hidden general content until rest of styling loads */
.visible-when-content-ready{
	visibility: hidden!important;
}
.display-when-content-ready{
	display: none!important;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Animations */ #}

.placeholder-shine{
  top: 0;
  left: -100%;
	position: absolute;
	width: 100%;
	height: 100%;
	opacity: 0.3;
	-webkit-animation: placeholder-shine 1.5s infinite;
	-ms-animation: placeholder-shine 1.5s infinite;
	-moz-animation: placeholder-shine 1.5s infinite;
	-o-animation: placeholder-shine 1.5s infinite;
	animation: placeholder-shine 1.5s infinite;
	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#1e5799+0,ffffff+41,ffffff+50,ffffff+60,7db9e8+100&0+0,0.63+41,1+50,0.45+60,0+100 */
	background: -moz-linear-gradient(left, rgba(30,87,153,0) 0%, rgba(255,255,255,0.63) 41%, rgba(255,255,255,1) 50%, rgba(255,255,255,0.45) 60%, rgba(125,185,232,0) 100%); /* FF3.6-15 */
	background: -webkit-linear-gradient(left, rgba(30,87,153,0) 0%,rgba(255,255,255,0.63) 41%,rgba(255,255,255,1) 50%,rgba(255,255,255,0.45) 60%,rgba(125,185,232,0) 100%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(to right, rgba(30,87,153,0) 0%,rgba(255,255,255,0.63) 41%,rgba(255,255,255,1) 50%,rgba(255,255,255,0.45) 60%,rgba(125,185,232,0) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#001e5799', endColorstr='#007db9e8',GradientType=1 ); /* IE6-9 */
}
@keyframes placeholder-shine {
  from {
    left: -100%;
  }
  to {
    left: 100%;
  }
}

.transition-up {
  opacity: 0;
}

{# /* // Placeholders and preloaders */ #}

.page-loading-icon{
	display: inline-block;
	height: 40px;
	width: 40px;
	margin: 40px auto;
}
.product-loading-icon{
	height: 25px;
	width: 25px;
	margin: 30px auto;
}
.mobile-placeholder,
.page-loading-icon-container{
	display: none;
	width: 100%;
}
.lazyloaded + .item-preloader-container {
	display:none;
}
.blur-up {
  -webkit-filter: blur(3px);
  filter: blur(3px);
  -moz-filter: blur(3px);
  -ms-filter: blur(3px);
  -o-filter: blur(3px);
  transition: filter .2s, -webkit-filter .2s;
}
.blur-up-huge {
  -webkit-filter: blur(6px);
  filter: blur(6px);
  -moz-filter: blur(6px);
  -ms-filter: blur(6px);
  -o-filter: blur(6px);
  transition: filter .2s, -webkit-filter .2s;
}
.blur-up.lazyloaded,
.blur-up-big.lazyloaded,
.blur-up-huge.lazyloaded,
.blur-up.swiper-lazy-loaded,
.blur-up-big.swiper-lazy-loaded,
.blur-up-huge.swiper-lazy-loaded {
  -webkit-filter: blur(0);
  filter: blur(0);
  -moz-filter: blur(0);
  -ms-filter: blur(0);
  -o-filter: blur(0);
}
.fade-in {
	opacity: 0;
}
.fade-in.lazyloaded {
	opacity: 1;
}
.slider-desktop-placeholder{
	height: 400px;
}
.placeholder-icon{
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

{# /* // Buttons and links */ #}

.btn.facebook {
  line-height: 28px;
	background-color: #1977f2;
	color: white;
}
.btn.facebook:hover,
.btn.facebook:focus,
.btn.facebook:active{
	background-color: #1977f2;
	color: white;
}
.btn.facebook .svg-fb-icon{
  height: 28px;
	position: absolute;
	top: 10px;
	left: 15px;
	fill: #fff;
}

.btn-social-icon{
	color:white;
  fill:white;
}
.btn-go-top{
	position:fixed;
	right: 10px;
	bottom: 10px;
	z-index: 99;
}

.svg-social-icon {
	height: 20px;
	fill: white;
}

.link-module-icon {
  display: inline-block;
  float: left;
  height: 20px;
  width: 18px;
  margin-right: 10px;
  opacity: 08;
}

.btn-location {
	color: white;
    background: transparent;
    border: 0;
    font-family: 'Helvetica';
    text-transform: uppercase;
    font-weight: bold;
    font-size: 12px;
}

.form-group-location {
	display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    align-content: center;
    gap: 20px;
}

.location-title {
	font-size: 5em; 
	font-weight: bold; 
	margin-top: 5em;
	text-align: center;
}

{# /* // Icons */ #}

.fa-xs {
  height: 10px;
  vertical-align: middle;
}
.fa-sm {
  height: 14px;
  vertical-align: middle;
}
.fa-md {
  height: 20px;
  vertical-align: middle;
}
.fa-lg {
  height: 24px;
  vertical-align: middle;
}
.fa-xl {
  height: 28px;
  vertical-align: middle;
}
.fa-2x {
  height: 34px;
  vertical-align: middle;
}
.fa-3x {
  height: 42px;
  vertical-align: middle;
}
.fa-4x {
  height: 58px;
  vertical-align: middle;
}
.fa-5x {
  height: 98px;
  vertical-align: middle;
}
.fa-spin {
  animation:fa-spin 2s infinite linear}
  @keyframes fa-spin{0%{transform:rotate(0deg)}to{transform:rotate(1turn)}
}

{# /* // Modals */ #}

.modal-right {
  z-index: 1048;
  width: 500px;
}

{# /* // Alerts and notifications */ #}

.notification-floating {
  position: fixed;
  top: 110px;
  right: 10px;
  z-index: 1040;
  width: 350px;
  border-radius: 3px;
}

.notification {
  position: relative;
  float: left;
  width: 100%;
  padding: 15px;
  text-align: center;
  box-shadow: 0 0 10px #6363634d;
}

.notification.notification-success {
	background-color: #4caf50;
	/*Hardcoded for green alert */
	color: white;
  fill: white;
}
.notification.notification-info {
	color: #496f82;
	background-color: #b6dff3;
}

.notification-close {
  position: absolute;
  top: 10px;
  right: 10px;
}

.notification-floating .notification-close {
	position: absolute;
	top: 0;
	right: 8px;
	z-index: 1;
	font-size: 18px; 
	cursor: pointer;
}

.notification-fixed-bottom {
  position: fixed;
  bottom: 10px;
  left: 20%;
  z-index: 999;
  width: 60%;
  border-radius: 3px;
}

{# /* Pills */ #}

.pills-container {
	padding: 10px 0;
	-moz-box-shadow: 0 0 3px #ccc;
	-webkit-box-shadow: 0 0 3px #ccc;
	box-shadow: 0 0 3px #ccc;
	border-radius: 3px;
}
.pill {
	display: inline-block;
	margin: 0 5px 10px 0;
}
.pill-link {
	display: block;
	padding: 7px 18px;
	font-size: 12px;
	border-radius: 30px;
}

{# /* // Breadcrumbs */ #}

.breadcrumb{
	margin:0;
    padding: 10px 0;
	font-size: 10px;
}

{# /* // Forms */ #}

.form-toggle-eye {
  right: 0;
  bottom: 0;
  display: flex;
  width: 42px;
  height: 42px;
  padding: 0;
  justify-content: center;
  align-items: center;
}

.form-control.input-error {
  border-color: #f44336;
}

{# /* // Banners */ #}

.banner-wrapper {
	position: relative;
	padding: 0;
}

.banner-with-text {
  position: relative;
  padding-top: 80%;
  margin: 0;
  overflow: hidden;
  box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.1), 0 2px 3px 0 rgba(0, 0, 0, 0.2);
  border-radius: 0;
}
.banner-with-text-link {
	display: block;
	width: 100%;
	height: 100%;
}
.banner-with-text .textbanner-image-background {
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.banner-with-text-link:hover{
  text-decoration: none;
}

<!-- .banner-with-text:hover .textbanner-image-background,
.banner-with-text:focus .textbanner-image-background {
	-webkit-transform: scale(1.03);
	-ms-transform: scale(1.03);
	-moz-transform: scale(1.03);
	-o-transform: scale(1.03);
	transform: scale(1.03);
} -->

.banner-with-text .text-container {
	position: absolute;
	bottom: 0;
	width: 100%;
	min-height: 100px;
	padding: 20px;
	background: rgba(0, 0, 0, 0.6);
}

.banner-with-text .text-container.more-padding {
	padding-right: 70px;
}

.banner-with-text .text-container.background-none {
	background: none;
}

.banner-with-text .text-container .banner-with-text-title {
	margin-top: 15px;
	margin-bottom: 15px;
}

.banner-with-text .text-container .banner-with-text-paragraph {
	display: -webkit-box;
	margin-bottom: 15px;
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}

.banner-with-text-button {
	position: absolute;
	top: 35px;
	right: 20px;
}

.banner-card{
  border-radius: 3px;
  box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.1), 0 2px 3px 0 rgba(0, 0, 0, 0.2);
}
.banner-card .banner-with-text{
  position: relative;
  padding-top: 80vh;
  margin: 0;
  box-shadow: none;
  border-radius: 0;
}
.banner-card .banner-with-text-button{
  top: 16px;
}
.banner-card .banner-info-container{
  position: relative;
  padding: 20px;
}
.banner-card .banner-info-container.more-padding{
  padding-right: 70px;
}

.banner{
	overflow: hidden;
  margin-bottom: 30px;
}
.banner-image{
	width: 100%;
	height: auto;
}

.textbanner-image-background {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

{# /* // Sliders */ #}

.slider-wrapper{
  -moz-box-shadow: 0 0 3px #ccc;
  -webkit-box-shadow: 0 0 3px #ccc;
  box-shadow: 0 0 3px #ccc;
  border-radius: 3px;
}
.slide-img{
  width: 100%;
}
.home-slider .swiper-slide {
  max-height: 560px!important;
  overflow: hidden;
}
.swiper-button-next, 
.swiper-button-prev {
  width: 28px;
  height: 28px;
  margin-top: -30px;
}
.swiper-button-next {
  right: 33px;
}
.slider-with-products-image {
	max-height: 400px;
	overflow: none; 
}
.slider-with-products-image img {
	max-height: 400px;
	height: 100%; 
}
.swiper-pagination {
  display: none;
}
.slider-home-products-wrapper {
  margin: 0 -15px;
}

{# /* // Images */ #}

/* Used for images that have a placeholder before it loads. The image container should have a padding-bottom inline with the result of (image height/ image width) * 100 */
.img-absolute {
	position: absolute;
	left: 0;
	width: 100%;
	height: auto;
	vertical-align: middle;
	text-indent: -9999px;
	z-index: 1;
  -webkit-transform: translate3d(0, 0, 0);
  -ms-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}

.img-absolute-centered{
	width: auto;
	left: 50%;
	-webkit-transform: translate3d(-50%, 0, 0);
	-ms-transform: translate3d(-50%, 0, 0);
	transform: translate3d(-50%, 0, 0);
}

.card-img-square-container {
  position: relative;
  width: 100%;
  padding-top: 100%;
}
.card-img-square {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

{# /* // Video */ #}

.video-container {
  box-shadow: 0 0 5px 0 rgba(0, 0, 0, .1), 0 2px 3px 0 rgba(0, 0, 0, .2);
}
.player-container {
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
  width: 100%;
  height: 100%;    
  cursor: pointer;
}
.player-container .btn-primary {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 70px;
  height: 70px;
  margin: -35px 0 0 -35px;
  padding: 0;
  line-height: 65px;
  text-align: center;
  border-radius: 70px;
}

.player-container .btn-primary.btn-small {
  width: 40px;
  height: 40px;
  margin: -20px 0 0 -20px;
  line-height: 35px;
}
.player-container .play-icon{
  width: 50px;
  margin: 2px 0 0px 2px;
  vertical-align: middle;
}

.player-container .btn-small .play-icon {
  width: 30px;
}
.video-image {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 100%;
  height: auto;
  transform: translate(-50%, -50%);
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}

{#/*============================================================================
  #Header and nav
==============================================================================*/ #}


{# /* // Nav desktop */ #}

.container-nav-right {
	display: flex;
    justify-content: flex-end;
    padding-right: 15px;
    align-items: center;
    flex-wrap: nowrap;
}

.on-sale {
	color: yellow!important; 
}
.nav-top-item {
	display: inline-block;
	background: #171717;
	padding: 5px;
}

.nav-top-item > a {
	margin-left: 0px; 
	padding: 10px;
}
.nav-top-item .nav-top-link,
.nav-top-item .nav-top-advertising {
	font-size: 10px;
	font-weight: 300;
	text-decoration: none;
	outline: 0;
	color: #FFFFFF;
}
.nav-top-item .nav-top-link:hover, .nav-top-item .nav-top-link:focus,
.nav-top-item .nav-top-advertising:hover,
.nav-top-item .nav-top-advertising:focus {
	text-decoration: none;
	outline: 0;
	color: black;
}

.nav-top-item:hover {
	background: #FFFFFF; 
	color: #171717;
}

.flag-item {
	display: inline-block; 
	background: transparent;
	padding-right: 4px;
}

.nav-top-link:hover {
	color: #171717;
}
.navbar {
	border: none; 
	border-radius: 0;
	margin: 0px;
	box-shadow: 0 2px 2px 0 rgba(0,0,0,.14),0 3px 1px -2px rgba(0,0,0,.2),0 1px 5px 0 rgba(0,0,0,.12);
	z-index: 998;
}

.navbar.head-fix {
	position: fixed;
	width: 100%;
	top: 0;
}

.navbar.search-visible {
	-webkit-transform: translate3d(0,0,0);
	-moz-transform: translate3d(0,0,0);
	-ms-transform: translate3d(0,0,0);
	-o-transform: translate3d(0,0,0);
	transform: translate3d(0,0px,0);
}

.navbar .desktop-nav-item {
	position:relative;
	float: none!important;/*Override specific Bootstrap property*/
	display: inline-block!important;/*Override specific Bootstrap property*/
	text-transform: uppercase;
}

.navbar .desktop-nav-item .desktop-nav-link{
	font-size: 10px;
	line-height: 24px;
}

.navbar .desktop-nav-item .desktop-nav-icon{
	display: inline-block;
	width: 34px;
	height: 23px;
	margin-right: -10px;
	vertical-align: text-bottom;
}


.nav-icon{
	width: 30px;
	height: auto;
	display: inline-block;
	padding: 8px;
}

.cart-summary-items{
	position: absolute;
	right: -2px;
	top: -4px;
	padding: 0px 6px;
	border-radius: 50%;
	z-index: 1;
	box-shadow: 0 0 5px 0 rgba(0, 0, 0, .1), 0 2px 3px 0 rgba(0, 0, 0, .2);
	font-size: 14px;
	font-weight: bold;
}
.fixed-summary{
	min-height: initial;
	top: -300px;
}  
.fixed-summary.with-cart-items.move-down{
	top: 0px;
	transition: all .5s cubic-bezier(.16,.68,.43,.99);
	-webkit-transform: translate(0,0);
	-moz-transform: translate(0,0);
	-ms-transform: translate(0,0);
	-o-transform: translate(0,0);
	transform: translate(0,0);
}

.navigation-container {
	position: relative;
	display:block;
}

.navigation-container ul {
	display: none; 
	position: absolute;
	z-index: 1;
}

.navigation-container:hover + .navigation-container ul {
	display: block;
	cursor: crosshair;
    margin-top: 70px;
	background: rgba(7, 7, 7, 0.9);
}

.paddingDie{
	padding: 0px;
}


{# /* // Nav mobile */ #}

.mobile-nav-second-row,
.mobile-nav-title-container{
	display: none;
}
.mobile-nav-empty-cart{
	display: none;
	position: fixed;
	top: 120px;
	left: 5%;
	box-sizing:border-box;
	width: 90%;
}

.mobile-nav-fixed-bottom {
  margin-bottom: 0;
  padding: 3px 0 0 0;
  overflow: hidden;
}

.mobile-nav-fixed-bottom .mobile-accounts {
  width: 100%;
  padding: 15px 0;
  box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.1), 0 2px 3px 0 rgba(0, 0, 0, 0.2);
}

{# /* // Logo */ #}

.logo-text{
	width: 100%;
	display:inline-block;
	margin:20px 0;
	text-transform: capitalize;
	font-weight: normal;
	line-height: 40px;
	text-align: center;
	text-decoration: none;
	outline: 0;
}
.logo-img-container {
	max-width: 450px;
	margin: auto;
	text-align: center;
}
.logo-img{
	margin: 20px 14px;
	vertical-align: middle;
	max-height: 170px;
}
.description-title {
    font-size: 21px;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin: 10px auto;
}

{#/*============================================================================
  #Product grid
==============================================================================*/ #}

{# /* // Category image */ #}

.category-image-container {
  position: relative;
  margin-bottom: 20px;
  padding: 5px 0;
  text-align: center;
  overflow: hidden;
}

.category-image-container:before {  
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: #00000080; /* hardcoded color - always will be dark */
  content: "";
}

.category-image {
  position: absolute;
  top: 50%;
  left: 50%;
  z-index: -1;
  width: 100%;
  transform: translate(-50%, -50%);
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}

.category-image-breadcrumb {
  margin-bottom: 0;
  padding: 0;
  color: white; /* Necesary for contrast with background image */
  text-shadow: 1px 1px black;
}

.category-image-breadcrumb .breadcrumb-crumb, 
.category-image-breadcrumb .breadcrumb-crumb.current,
.category-image-breadcrumb .breadcrumb-crumb.active {
  color: white; /* Necesary for contrast with background image */
}

.category-image-title {
  color: white; /* Necesary for contrast with background image */
  text-shadow: 1px 1px black;
}

{# /* // Category description */ #}

.category-description-container {
  position: relative;
  margin: 0 0 20px 0;
  text-align: center;
}

.category-description-container.with-image {
  margin: -30px 0 30px 0;
}

{# /* // Filters and categories */ #}

.select-container .sort-by {
  position: relative;
  z-index: 99;
  background: none;
}

.select-container.sort-by-container:before {
  display: none;
}

.sort-by-arrow {
  position: absolute;
  right: 20px;
  bottom: 10px;
  width: 20px;
}

{# /* // Grid item */ #}

.primary-products-grid {
	padding: 0;
}

.product-row {
	margin-right: -10px;
	margin-left: -10px;
}

.item-container {
	padding: 0 4px;
}
.item-container .item {
	border-radius: 3px;
	box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.1), 0 2px 3px 0 rgba(0, 0, 0, 0.2);
}
.item-image-container {
	width: 100%;
}
.item-image {
  width: auto;
  max-width: none;
  height: 100%;
}
.item-image-link {
	width: 100%;
	float: left;
	overflow: hidden;
	border-radius: 0;
}
.item-colors {
  position: absolute;
  bottom: 0;
  z-index: 9;
  padding: 10px;
}
.item-colors-bullet {
  display: inline-block;
  min-width: 18px;
  height: 18px;
  margin: 0 3px;
  font-size: 10px;
  line-height: 16px;
  vertical-align: top;
  text-align: center;
  border-radius: 18px;
  cursor: pointer;
  opacity: 0.8;
  text-transform: uppercase;
  -webkit-transition: all 0.4s ease;
  -ms-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  transition: all 0.4s ease;
}
.item-colors-bullet:hover,
.item-colors-bullet.selected {
  opacity: 1;
}
.item-colors-bullet-text {
  margin: 0;
  padding: 0 5px;
}
.item-name {
	display: block;
	margin-top: 0;
	font-size: 10px;
	font-weight: bold;
	overflow: hidden; 
	white-space: nowrap; 
	text-overflow: ellipsis;
}
.item-info-container {
	position: relative;
	z-index: 9;
	clear: both;
	padding: 10px 0;
}
.item-quickshop {
	position: absolute;
	bottom: 15px;
	right: 15px;
	z-index: 99;
	width: 24px;
}
.item-price {
	font-weight: bold;
}
.item-price-compare {
	padding-right: 5px;
	opacity: 0.8;
	text-decoration: line-through;
}
.item-labels {
  position: absolute;
  top: 5px;
  right: 5px;
  z-index: 10;
  text-align: right;
  pointer-events: none;
}

.item-labels .product-label,
.item-labels .label {
  float: right;
  clear: both;
}

.overlay-no-stock{
  position: absolute;
  z-index: 9;
  width: 100%;
  height: 100%;
  background: rgba(0,0,0,0.5); /* No stock hardcoded overlay */
  left: 0;
  top: 0;
  text-align: center;
  text-transform: uppercase;
  border-radius: 0;
}
.overlay-no-stock-text{
  position: absolute;
  top: 40%;
  width: 100%;
  color: white;
}
.item-quickshop-link {
	display: none;
	position: absolute;
	left: 50%;
	top: 45%;
	width: 180px;
	margin-left: -90px;
	padding: 10px;
	word-wrap: break-word;
	white-space: normal;
	text-align: center;
	text-transform: uppercase;
	z-index: 9;
	text-decoration: none;
	outline: 0;
}
.item-quickshop-link:hover {
	opacity: 0.9;
}
.item-quickshop-link:hover,
.item-quickshop-link:focus {
	text-decoration: none;
	outline: 0;
}
.item-image-container:hover .item-quickshop-link {
	display: block;
}
.item-mobile-link {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	padding: 8px;
}
.item-mobile-link-quickshop {
	height: calc(100% - 60px);
}
.item-quickshop-icon {
	width: 24px;
	height: 28px;
}


{# /* // Labels */ #}

.product-labels {
    display: flex;
    margin-left: -5px;
}
.product-label {
	border-radius:16px;
	padding: 2px 10px;
	margin: 5px;
	text-align: center;
	font-size: 14px;
	line-height: 20px;
	font-weight: bold;
	text-transform: uppercase;
}
.product-label-icon {
	display: inline-block;
	width: 20px;
	height: 22px;
	padding-top:1px;
	margin-right: 3px;
	vertical-align: middle;
}
.product-label-small {
  padding: 5px 7px;
  font-size: 10px;
  font-weight: bold;
  line-height: initial;
}
.product-label-small .product-label-icon {
  width: 15px;
  height: 17px;
}
.product-label-text {
	display: inline-block;
	vertical-align: middle;
}
.product-label .label-small {
	font-size: 65%;
	text-transform: lowercase;
}

{#/*============================================================================
  #Product detail
==============================================================================*/ #}

{# /* // Header */ #}

.product-detail {
    margin-top: -50px; /* Overlap between product image and the product hero*/
}
.product-detail.product-form-below {
	margin-top: -240px;
}
.product-detail.product-form-below .product-labels{
    justify-content: center;
}

.product-hero {
	position: relative;
	overflow: hidden;
	height: auto;
	margin-bottom: 30px;
}

.product-hero-image {
	position: absolute;
	top: -200%;
	left: 0;
	width: 100%;
	-webkit-filter: blur(25px);
	filter: blur(25px);
	-moz-filter:blur(25px);
	-o-filter:blur(25px); 
	-ms-filter:blur(25px);
}

.product-hero-overlay {
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background-color: black; /* hardcoded color - always will be dark */
	opacity: 0.2;
	-webkit-box-shadow: inset 6px -11px 5px -10px rgba(0,0,0,0.90);
	-moz-box-shadow: inset 6px -11px 5px -10px rgba(0,0,0,0.90);
	box-shadow: inset 6px -11px 5px -10px rgba(0,0,0,0.90);
}

.product-breadcrumb{
	float: none;
	margin-bottom: 0px;
	padding: 0px;
	background: none;
	color: white;
	text-shadow: 1px 1px black;
	text-transform: uppercase;
}

.product-name-container{
	position: relative; 
	margin-top: 10px;
	padding-top: 10px;
	text-align: center;
}  
.product-name-container.product-form-below{
	margin-bottom: 250px;
}
.product-name-container .product-name{
	clear: both;
	margin: 10px 0 40px 0;
	color: white; /* Necesary for contrast with background image */
	text-align: center;
	text-shadow: 1px 1px black;
}

{# /* // Image */ #}

.product-single-image{
	-moz-box-shadow: 0 0 3px #ccc;
	-webkit-box-shadow: 0 0 3px #ccc;
	box-shadow: 0 0 3px #ccc;
	border-radius: 3px;
	background-color: white;
}
.product-social-sharing {
	position:absolute;
	left: -47px;
	top: 0; 
}
.product-social-sharing .product-btn-share {
	float: right;
	clear: both;
	margin-bottom: 10px;
}
.product-single-image{
  height: 0;
}
.product-single-image img{
  left: 50%;
  transform: translateX(-50%);
  -webkit-transform: translateX(-50%);
  -ms-transform: translateX(-50%);
}
.product-slide{
}
.product-slider-image{
  width: auto;
  height: 100%;
 
}
.product-with-1-img img{
  margin: auto;
}
.product-slider{
}

.swiper-button-product.swiper-button-prev,
.swiper-button-product.swiper-button-next {
  margin-top: -15px;
}
.swiper-button-product.swiper-button-prev {
  left: 15px;
}
.swiper-button-product.swiper-button-next {
  right: 15px;
}

.product-thumb{
  position: relative;
  display: inline-block;
  width: 100px;
  height: 70px;
  margin: 5px;
  vertical-align: top;
}
.product-thumb-image{
  position: absolute;
  left: 50%;
  top: 50%;
  max-width: 100%;
  max-height: 100%;
  margin: 0 auto;
  transform: translate(-50%, -50%);
}
.product-video-container {
  display: block;
  width: 100%;
  height: 100%;
}
.product-video {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
}
.product-video .embed-responsive {
  width: 100%;
}
.product-video .video-image{
  width: auto;
  height: 100%;
}

/*============================================================================
  #Cart detail
==============================================================================*/

.text-uppercase-cart {
	font-size: 12px;
	text-transform: uppercase;
}

{# /* // Shipping Calculator */ #}

.free-shipping-title {
  position: relative;
  height: 50px;
}
.shipping-calculator-head.with-zip {
  height: 25px;
}
.shipping-calculator-head.with-zip.with-free-shipping {
  height: 75px;
  margin-top: 10px;
}
.shipping-calculator-head.with-form {
  height: 95px;
}
.shipping-calculator-head.with-error {
  height: 150px;
}

{#/*============================================================================
  #Media queries
==============================================================================*/#}

{# /* // Max width 767px */ #}

@media (max-width: 767px){

	{# /* //// Components */ #}

	{# /* Placeholders and preloaders */ #}

  .blur-up,
  .blur-up-big {
    -webkit-filter: blur(2px);
    filter: blur(2px);
    -moz-filter: blur(2px);
    -ms-filter: blur(2px);
    -o-filter: blur(2px);
    transition: filter .2s, -webkit-filter .2s;
  }
	.mobile-placeholder,
	.page-loading-icon-container {
		position: relative;
		display: block;
		box-sizing: border-box;
		overflow: hidden;
	} 
	.slider-desktop-placeholder {
		display: none;
	}
	.placeholder-figures-container {
		width: 100%;
		padding: 5%;
		overflow: hidden;
	}
	.placeholder-left-col {
		width: 30%;
	}
	.placeholder-right-col {
		width: 60%;
		margin-left: 10%;
	}
	.placeholder-square {
		position: relative;
		width: 100%;
		border-radius: 6px;
	}
	.placeholder-square:after {
		content: "";
		display: block;
		padding-bottom: 100%;
	} 
	.placeholder-line {
		border-radius: 2px;
	}
	.placeholder-line.small{
		height: 10px;
	}
  .placeholder-line-medium{
    position: relative;
    height: 20px;
  }
	.placeholder-line:after{
		content: "";
		display: block;
		padding-top: 10%;
	}
	.placeholder-line.big:after{
		padding-top: 15%;
	}
  .product-placeholder-container{
    max-height: 350px;
  }
  .product-placeholder{
    max-width: 100%;
    left: 50%;
    transform: translateX(-50%);
    -webkit-transform: translateX(-50%);
    -ms-transform: translateX(-50%);
    max-height: 300px;
  }
	

	{# /* Modals */ #}

	.modal-xs {
		position: fixed;
		top: 0;
		z-index: 4200;
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
		border: 0;
		opacity: 1;
		box-sizing: border-box;
		overflow: auto;
		box-shadow: none;
	}
	.modal-xs.sheet-bottom {
		top: initial !important;
		left: 0;
		bottom: 0;
		padding: 50% 0 0 0;
		z-index: 4300;
	}
	.modal-xs-dialog {
		display: flex;
		flex-direction: column;
		height: 100%;
		margin: 0;
		-webkit-transform: translate3d(0, 0, 0) !important;
		-ms-transform: translate3d(0, 0, 0) !important;
		-moz-transform: translate3d(0, 0, 0) !important;
		transform: translate3d(0, 0, 0) !important;
	}
	.modal-xs-dialog .modal-content {
		height: 100%;
		overflow: auto;
		box-shadow: none;
		border: 0;
	}
	.modal-xs-header {
		position: relative;
		display: block;
		padding: 20px 15px;
		clear: both;
		text-decoration: none;
		ms-word-break: break-all;
		word-wrap: break-word;
		-webkit-hyphens: auto;
		-moz-hyphens: auto;
		hyphens: auto;
		-webkit-tap-highlight-color: transparent;
	}
	.modal-xs-header.sheet-bottom-header {
		text-align: center;
	}
	.modal-xs-header.sheet-bottom-header .btn,
	.modal-xs-header.sheet-bottom-header .btn-link {
		position: absolute;
	}
	.modal-xs-header.sheet-bottom-header .btn-primary {
		padding: 8px 10px;
		font-size: 14px;
	}
	.modal-xs-header.sheet-bottom-header .link-left {
		left: 15px;
		top: 22px;
		padding: 0;
	}
	.modal-xs-header.sheet-bottom-header .btn-right {
		right: 15px;
		top: 10px;
	}
	.modal-xs-header-text {
		display: inline-block;
		margin-right: 40px;
		margin-top: -1px;
		clear: both;
		font-size: 18px;
	}
	.modal-xs-header-text.modal-xs-right-header-text {
		margin-left: 40px;
		margin-right: 0;
	}
	.modal-xs-header-icon {
		position: absolute;
		top: 16px;
		right: 15px;
	}
	.modal-xs-header-icon.modal-xs-right-header-icon {
		top: 17px;
		left: 10px;
		right: initial;
	}
	.modal-xs-body {
		height: 100%;
		max-height: initial;
		padding: 10px 10px 40px 10px;
		overflow: initial;
	}
	.modal-xs-body-list {
		padding: 0 0 200px 0;
		overflow-y: auto;
	}
	.modal-xs-list-item {
		position: relative;
		display: block;
		clear: both;
		padding: 20px 30px 20px 15px;
		text-decoration: none;
	}
	.modal-xs-radio-icon-container {
		width: 12%;
		display: inline-block;
		float: left;
	}
	.modal-xs-radio-icon-container .modal-xs-radio-icon {
		display: inline-block;
		cursor: pointer;
		opacity: 0.7;
	}
	.modal-xs-radio-text {
		display: inline-block;
		width: 88%;
		margin-top: 3px;
	}

	.modal-xs-right.modal.fade,
	.modal-xs-right-out{
		transition: all 1.5s cubic-bezier(.16,.68,.43,.99);
		-webkit-transform: translate3d(200%,0,0);
		-moz-transform: translate3d(200%,0,0);
		-ms-transform: translate3d(200%,0,0);
		-o-transform: translate3d(200%,0,0);
		transform: translate3d(200%,0,0);
	}
	.modal-xs-bottom.modal.fade,
	.modal-xs-bottom-out{
		transition: all 1.5s cubic-bezier(.16,.68,.43,.99);
		-webkit-transform: translate3d(0,100%,0);
		-moz-transform: translate3d(0,100%,0);
		-ms-transform: translate3d(0,100%,0);
		-o-transform: translate3d(0,100%,0);
		transform: translate3d(0,100%,0);
	}

	{# /* Modals v2 - applied for now only on hamburguer panel */ #}

	.new-modal {
		position: fixed;
		top: 0;
		display: block;
		width: 80%;
		height: 100%;
		-webkit-overflow-scrolling: touch;
		overflow-y: auto;
		transition: all 0.2s cubic-bezier(0.16, 0.68, 0.43, 0.99);
		z-index: 4200;
	}
	.new-modal.modal-full {
		width: 100%;
	}
	.new-modal.modal-top {
		top: -100%;
	}
	.new-modal.modal-bottom {
		top: 100%;
	}
	.new-modal.modal-left {
		left: -100%;
	}
	.new-modal.modal-right {
		right: -100%;
	}
	.new-modal.modal-top.modal-show, .new-modal.modal-bottom.modal-show {
		top: 0;
	}
	.new-modal.modal-left.modal-show {
		left: 0;
	}
	.new-modal.modal-right.modal-show {
		right: 0;
	}

	{# /* Buttons and links */ #}

	.btn-module {
		-webkit-tap-highlight-color: rgba(0,0,0,0);
		text-align: left;
	}
	.btn-module p{
		font-weight: bold;
	}
	
	.link-module-icon-right,
	.btn-module-icon-right {
		position: absolute;
		top: 50%;
		right: 0;
		display: block;
		width: 36px;
		height: 36px;
		margin-top: -18px;
		float: right;
	}
	.link-module{
		margin-bottom: 0;
		padding: 10px 0;
		margin-bottom: 10px;
		text-align: left;
	}

	{# /* Pills */ #}
	.pills-container.horizontal-container {
		width: 96%;
		margin: 0 auto 20px auto;
	}

	{# /* Banners */ #}

	.banner-wrapper {
		padding: 0 15px;
	}

  .banner-with-text {
    padding-top: 80%;
  }

  .banner-card .banner-with-text{
    padding-top: 60vh;
  }
	.banner-with-text .text-container {
		min-height: 80px;
		padding: 5px 10px;
	}

	.banner-with-text-button {
		top: 15px;
		right: 10px;
	}

  .banner-card .banner-with-text-button{
    top: 13px;
    width: 40px;
    height: 40px;
  }

	{# /* Sliders */ #}

  .swiper-container-horizontal>.swiper-pagination-bullets {
    position: relative;
    bottom: 0;
    display: block;
    margin: 10px 0;
  }

  .slider-home-products-wrapper {
    margin: 0;
  }

	{# /* // Alerts and notifications */ #}

	.notification-floating {
		top: initial;
		right: 0;
		bottom: 0;
		width: calc(100% - 20px);
		margin: 10px;
	}

  .notification-floating .notification{
    border-radius: 3px;
  }

  .notification-fixed-bottom {
    left: 15px;
    width: calc(100% - 30px);
  }

	.notification:not(.notification-fixed-bottom) {
		border-radius: 0;
	}

	{# /* //// Header and nav */ #}

	{# /* Nav mobile */ #}

	.site-overlay {
		display: none
	}
	.modal-active{
		margin: 0;
		height: 100%;
		overflow: hidden;
	}
	.modal-active .site-overlay{
		display: block;
		position: fixed;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		z-index: 4100;
		background-color: rgba(0,0,0,.5);
		-webkit-animation: fade .5s;
		-moz-animation: fade .5s;
		-o-animation: fade .5s;
		animation: fade .5s;
	}

	.hamburger-panel {
		box-shadow: none;
	}
	.hamburger-panel .btn-hamburger-close {
		right: 15px;
		top: 6px;
		font-size: 18px;
	}
	.hamburger-panel .list-items {
		padding: 45px 0 10px;
	}
	.hamburger-panel .list-items .hamburger-panel-link {
		display: block;
		padding: 20px;
		letter-spacing: 1px;
		font-weight: 400;
		border-bottom: 0;
	}
	.hamburger-panel .list-items .list-subitems {
		padding: 0;
	}
	.hamburger-panel .hamburger-panel-arrow {
		font-size: 12px;
	}
	.hamburger-panel .hamburger-panel-link.selected .hamburger-panel-arrow {
		transform: rotate(90deg);
	}
	.hamburger-panel .hamburger-panel-first-row {
		background: none;
	}
	.hamburger-panel .hamburger-panel-first-row .mobile-accounts {
		padding: 0 12px;
	}
	.hamburger-panel .hamburger-panel-first-row .mobile-accounts .mobile-accounts-item {
		width: auto;
		display: inline-block;
	}
	.hamburger-panel .hamburger-panel-first-row .mobile-accounts .mobile-accounts-item .mobile-accounts-link {
		padding: 10px 5px;
		font-size: 12px;
		opacity: 0.6;
	}
	.hamburger-panel .hamburger-panel-first-row .mobile-accounts .mobile-accounts-item:first-child a:after {
		position: relative;
		right: -7px;
	}
	.hamburger-panel-arrow {
		top: 15px;
		right: 10px;
		margin-top: -10px;
	}
	.hamburger-panel-arrow.selected i {
		transform-origin: center;
		transform: rotate(180deg);
		-webkit-transform: rotate(180deg);
		-moz-transform: rotate(180deg);
		-ms-transform: rotate(180deg);
		-o-transform: rotate(180deg);
	}
	
	.mobile-nav-first-row .nav-icon {
		width: 30px;
		height: 30px;
		padding: 1px;
	}
	.mobile-nav-first-row .mobile-btn-hamburger-container {
		display: inline-block !important;
		width: 24%;
		padding: 0px 10px;
		vertical-align: middle;
	}
	.mobile-nav-first-row .mobile-btn-hamburger-container .btn-hamburger {
		height: 36px;
		width: 36px;
		padding: 3px;
		border-radius: 50%;
	}
	.mobile-nav-first-row .mobile-btn-hamburger-container .btn-hamburger .nav-icon {
		width: 30px;
		height: 30px;
		padding: 4px;
	}
	.mobile-nav-first-row .logo-container {
		display: inline-block !important;
		width: 48%;
		vertical-align: middle;
	}
	.mobile-nav-first-row .nav-icons {
		display: inline-block;
		width: 24%;
		float: none;
		vertical-align: middle;
		margin: 0 !important;
		padding: 0 5px !important;
	}
	.mobile-nav-first-row .nav-icons a {
		vertical-align: middle;
	}
	.mobile-nav-first-row .head-cart,
	.mobile-nav-first-row .toggle-search {
		vertical-align: middle;
	}

	.mobile-nav {
		position: relative;
		top: 0;
		left: 0;
		width: 100%;
		min-height: 45px;
		z-index: 4000;
	}
	.mobile-nav.head-fix {
		position: fixed;
		top: 0;
	}
	.mobile-nav-first-row {
		max-height: 85px;
		min-height: 45px;
	}
	.mobile-nav-title-container {
		display: block;
	}
	.mobile-nav-title {
		float: left;
		width: 75%;
		margin-left: 5px;
		margin-top: 13px;
		font-weight: normal;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		font-weight: normal;
	}
	.mobile-nav-second-row {
		display: block;
		width: 100%;
		float: left;
	}
	.mobile-nav-tab {
		position: relative;
		padding: 10px 0;
		text-align: center;
		text-transform: uppercase;
		font-size: 10px;
		text-decoration: none;
		outline: 0;
	}
	.mobile-nav-tab:hover,
	.mobile-nav-tab:focus {
		text-decoration: none;
		outline: 0;
	}
	.mobile-nav-tab a {
		text-decoration: none;
		outline: 0;
	}
	.mobile-nav-tab a:hover,
	.mobile-nav-tab a:focus {
		text-decoration: none;
		outline: 0;
	}
	.mobile-nav-tab .cart-summary-items {
		top: 5px;
		right: 50%;
		margin-right: -25px;
	}

	.mobile-nav-categories-container {
		top: 130px;
		margin: 0;
		padding: 0 0 200px 0;
		z-index: 1000;
		-webkit-overflow-scrolling: touch;
		overflow: auto;
	}

	.move-list-up .mobile-nav-subcategories-panel {
		top: 75px;
	}

	.flag-item {
		padding-right: 5px;
	}

	{# /* Logo */ #}

	.logo-text{
		display: block;
		margin-top: 20px;
		margin: 20px auto 10px auto;
		width: 100%;
		font-size: 24px;
		line-height: normal;
	}
	.logo-img{
		margin: 0;
		max-height: 60px;
		max-width: 60%;
		margin: 15px auto 20px auto;
	}
	.mobile-logo-home .logo-img{
		max-height: 65px;
		max-width: 100%;
		margin: 10px auto;
	}

	{# /* //// Product grid */ #}

	{# /* Grid item */ #}

	.item-container .item-name{
		margin-bottom: 5px;
		font-size: 10px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	{# /* //// Product detail */ #}

	.product-hero .product-name-container {
		margin-bottom: 30px;
	}
	.product-hero .product-name-container .product-name,
	.product-hero .product-name-container .product-breadcrumb {
		text-shadow: none;
		text-align: left;
		margin: 0 15px;
	}

	{# /* // Header */ #}

	.product-name-container {
		margin-top: 0;
	}
	.product-name-container .product-name {
		font-size: 20px;
		line-height: inherit;
	}
	.product-name-container.product-form-aside .product-name {
		margin-bottom: 140px;
	}

	{# /* // Image */ #}

	.product-label-icon {
		width: 14px;
		height: 16px;
	}
  .product-slide,
  .product-slider-image{
  }

  {# /* Video */ #}

  .product-video .video-image {
    max-width: initial;
  }
  .product-video .embed-responsive{
    height: 100%;
    padding-bottom: 0;
  }

	{# /* // Form and info */ #}

	.product-price-container{
		margin-top:0;
	}

	.location-title {
		font-size: 4em;
	}

	.form-group-location {
		gap: 5px;
	}

	.btn-location {
		font-size: 10px;
	}

}

{#/*============================================================================
  #Utilities classes
==============================================================================*/#}

{# /*CSS properties helpers minified, to unminify it you have to copy the code and paste it here http://unminify.com/, after that paste the unminified code here */ #}

.row-flex{display:-ms-flexbox;display:flex;-ms-flex-wrap:wrap;flex-wrap:wrap;margin-right:-15px;margin-left:-15px}.align-items-center{-ms-flex-align:center!important;align-items:center!important}.col{-ms-flex-preferred-size:0;flex-basis:0;-ms-flex-positive:1;flex-grow:1;max-width:100%}.col-auto{-ms-flex:0 0 auto;flex:0 0 auto;width:auto;max-width:none}.overide-container-width{margin-left:-15px!important;margin-right:-15px!important}.d-inline{display:inline}.d-block{display:block}.d-table{display:table}.d-flex{display:flex}.d-inline-block-xs{display:none}.d-inline-block{display:inline-block}.p-relative{position:relative!important}.p-absolute{position:absolute!important}.p-fixed{position:fixed}.clear-both{clear:both!important}.opacity-80{opacity:.8!important}.opacity-50{opacity:.5!important}.opacity-10{opacity:.1!important}.full-height{height:100%!important}.full-width-container{float: left; width: 100%; clear: both;}.full-width{width:100%!important}.width-auto{width:auto}.m-top{margin-top:20px!important}.m-top-double{margin-top:40px!important}.m-top-half{margin-top:10px!important}.m-top-quarter{margin-top:5px!important}.m-top-none{margin-top:0!important}.m-right{margin-right:20px!important}.m-right-double{margin-right:40px!important}.m-right-half{margin-right:10px!important}.m-right-quarter{margin-right:5px!important}.m-right-none{margin-right:0!important}.m-bottom-double{margin-bottom:40px!important}.m-bottom{margin-bottom:20px!important}.m-bottom-half{margin-bottom:10px!important}.m-bottom-quarter{margin-bottom:5px!important}.m-bottom-none{margin-bottom:0!important}.m-bottom-half-neg{margin-bottom:-10px!important}.m-left{margin-left:20px!important}.m-left-half{margin-left:10px!important}.m-left-quarter{margin-left:5px!important}.m-left-none{margin-left:0!important}.m-all{margin:20px!important}.m-all-half{margin:10px!important}.m-all-quarter{margin:5px!important}.m-auto{margin:auto!important}.m-none{margin:0!important}.p-top{padding-top:20px!important}.p-top-double{padding-top:40px!important}.p-top-half{padding-top:10px!important}.p-top-quarter{padding-top:5px!important}.p-top-none{padding-top:0!important}.p-right{padding-right:20px!important}.p-right-double{padding-right:40px!important}.p-right-half{padding-right:10px!important}.p-right-quarter{padding-right:5px!important}.p-right-none{padding-right:0!important}.p-bottom{padding-bottom:20px!important}.p-bottom-double{padding-bottom:40px!important}.p-bottom-half{padding-bottom:10px!important}.p-bottom-quarter{padding-bottom:5px!important}.p-bottom-none{padding-bottom:0!important}.p-left{padding-left:20px!important}.p-left-double{padding-left:40px!important}.p-left-half{padding-left:10px!important}.p-left-quarter{padding-left:5px!important}.p-left-none{padding-left:0!important}.p-all{padding:20px!important}.p-all-half{padding:10px!important}.p-all-quarter{padding:5px!important}.p-none{padding:0!important}.text-left{text-align:left!important}.text-right{text-align:right!important}.text-center{text-align:center!important}.text-justify{text-align:justify!important}.text-nowrap{white-space:nowrap!important}.text-lowercase{text-transform:lowercase!important}.text-uppercase{text-transform:uppercase!important}.text-capitalize{text-transform:capitalize!important}.text-wrap{-ms-word-break:break-all!important;word-wrap:break-word!important;-webkit-hyphens:auto!important;-moz-hyphens:auto!important;hyphens:auto!important}.text-trim{white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.text-underline{text-decoration:underline}ul.list-style-none{padding:0}.list-style-disc{list-style: disc}ul.list-style-none li{list-style:none}.no-link,.no-link:focus,.no-link:hover{text-decoration:none;outline:0}.overflow-none{overflow:hidden}.wrap{flex-wrap:wrap}.order-one{order:1}.icon-align-middle{margin-top: 3px; vertical-align: middle;}.align-icon-with-text{line-height: 26px}.align-baseline{vertical-align:baseline!important}.align-top{vertical-align:top!important}.align-middle{vertical-align:middle!important}.align-bottom{vertical-align:bottom!important}.align-sub{vertical-align:sub!important}.align-text-bottom{vertical-align:text-bottom!important}.align-text-top{vertical-align:text-top!important}

{# /* // Mobile helpers */ #}

@media (max-width: 767px){
  .container{padding-right:10px;padding-left:10px;}.overide-container-width,.overide-container-width-xs{width:100vw!important}.clear-both-xs{clear:both!important}.f-none-xs{float:none!important}.pull-none-xs{float:none!important}.pull-left-xs{float:left!important}.d-block-xs{display:block}.d-inline-block-xs{display:inline-block}.d-flex-xs{display: flex!important;}.full-width-xs{width:100%!important}.p-all-half-xs{padding:10px!important}.p-all-quarter-xs{padding:5px!important}.p-none-xs{padding:0!important}.p-top-xs{padding-top:20px!important}.p-top-half-xs{padding-top:10px!important}.p-top-quarter-xs{padding-top:5px!important}.p-top-none-xs{padding-top:0!important}.p-right-double-xs{padding-right:40px}.p-right-half-xs{padding-right:10px!important}.p-right-quarter-xs{padding-right:5px!important}.p-right-none-xs{padding-right:0!important}.p-bottom-xs{padding-bottom:20px!important}.p-bottom-double-xs{padding-bottom:40px!important}.p-bottom-half-xs{padding-bottom:10px!important}.p-left-col-xs{padding-left:15px!important}.p-left-half-xs{padding-left:10px!important}.p-left-quarter-xs{padding-left:5px!important}.p-left-none-xs{padding-left:0!important}.m-none-xs{margin:0!important}.m-top-xs{margin-top:20px!important}.m-top-half-xs{margin-top:10px!important}.m-top-quarter-xs{margin-top:5px!important}.m-top-none-xs{margin-top:0!important}.m-right-xs{margin-right:20px!important}.m-right-none-xs{margin-right:0!important}.m-bottom-xs{margin-bottom:20px!important}.m-bottom-half-xs{margin-bottom:10px!important}.m-bottom-quarter-xs{margin-bottom:5px!important}.m-bottom-none-xs{margin-bottom:0!important}.m-left-xs{margin-left:20px!important}.m-left-half-xs{margin-left:10px!important}.border-none-xs{border:0!important}.text-center-xs{text-align:center!important}.text-left-xs{text-align:left!important}.text-right-xs{text-align:right!important}.horizontal-container{overflow-x:scroll!important;width:100%;}.horizontal-container::-webkit-scrollbar{width:1px!important;height:0!important}.horizontal-container::-webkit-scrollbar-track{background:0 0!important;border-radius:10px!important}.horizontal-container::-webkit-scrollbar-thumb{border-radius:1px!important}.horizontal-container-item{float:none!important;display:inline-block}.horizontal-container ul,.horizontal-products-scroller{white-space:nowrap!important}
}


{% endraw %}
