/*! jquery.livequery - v1.3.6 - 2013-08-26
 * Copyright (c)
 *  (c) 2010, Brandon Aaron (http://brandonaaron.net)
 *  (c) 2012 - 2013, Alexander Zaytsev (http://hazzik.ru/en)
 * Dual licensed under the MIT (MIT_LICENSE.txt)
 * and GPL Version 2 (GPL_LICENSE.txt) licenses.
 */
!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof exports?a(require("jquery")):a(jQuery)}(function(a,b){function c(a,b,c,d){return!(a.selector!=b.selector||a.context!=b.context||c&&c.$lqguid!=b.fn.$lqguid||d&&d.$lqguid!=b.fn2.$lqguid)}a.extend(a.fn,{livequery:function(b,e){var f,g=this;return a.each(d.queries,function(a,d){return c(g,d,b,e)?(f=d)&&!1:void 0}),f=f||new d(g.selector,g.context,b,e),f.stopped=!1,f.run(),g},expire:function(b,e){var f=this;return a.each(d.queries,function(a,g){c(f,g,b,e)&&!f.stopped&&d.stop(g.id)}),f}});var d=a.livequery=function(b,c,e,f){var g=this;return g.selector=b,g.context=c,g.fn=e,g.fn2=f,g.elements=a([]),g.stopped=!1,g.id=d.queries.push(g)-1,e.$lqguid=e.$lqguid||d.guid++,f&&(f.$lqguid=f.$lqguid||d.guid++),g};d.prototype={stop:function(){var b=this;b.stopped||(b.fn2&&b.elements.each(b.fn2),b.elements=a([]),b.stopped=!0)},run:function(){var b=this;if(!b.stopped){var c=b.elements,d=a(b.selector,b.context),e=d.not(c),f=c.not(d);b.elements=d,e.each(b.fn),b.fn2&&f.each(b.fn2)}}},a.extend(d,{guid:0,queries:[],queue:[],running:!1,timeout:null,registered:[],checkQueue:function(){if(d.running&&d.queue.length)for(var a=d.queue.length;a--;)d.queries[d.queue.shift()].run()},pause:function(){d.running=!1},play:function(){d.running=!0,d.run()},registerPlugin:function(){a.each(arguments,function(b,c){if(a.fn[c]&&!(a.inArray(c,d.registered)>0)){var e=a.fn[c];a.fn[c]=function(){var a=e.apply(this,arguments);return d.run(),a},d.registered.push(c)}})},run:function(c){c!==b?a.inArray(c,d.queue)<0&&d.queue.push(c):a.each(d.queries,function(b){a.inArray(b,d.queue)<0&&d.queue.push(b)}),d.timeout&&clearTimeout(d.timeout),d.timeout=setTimeout(d.checkQueue,20)},stop:function(c){c!==b?d.queries[c].stop():a.each(d.queries,d.prototype.stop)}}),d.registerPlugin("append","prepend","after","before","wrap","attr","removeAttr","addClass","removeClass","toggleClass","empty","remove","html","prop","removeProp"),a(function(){d.play()})});

/*!
 * Bootstrap v3.2.0 (http://getbootstrap.com) including only Modals and Tabs
 * Copyright 2011-2015 Twitter, Inc.
 * Licensed under the MIT license
 */
if("undefined"==typeof jQuery)throw new Error("Bootstrap's JavaScript requires jQuery");+function(t){"use strict";var e=t.fn.jquery.split(" ")[0].split(".");if(e[0]<2&&e[1]<9||1==e[0]&&9==e[1]&&e[2]<1||e[0]>3)throw new Error("Bootstrap's JavaScript requires jQuery version 1.9.1 or higher, but lower than version 4")}(jQuery),+function(t){"use strict";function e(e,n){return this.each(function(){var o=t(this),s=o.data("bs.modal"),a=t.extend({},i.DEFAULTS,o.data(),"object"==typeof e&&e);s||o.data("bs.modal",s=new i(this,a)),"string"==typeof e?s[e](n):a.show&&s.show(n)})}var i=function(e,i){this.options=i,this.$body=t(document.body),this.$element=t(e),this.$dialog=this.$element.find(".modal-dialog"),this.$backdrop=null,this.isShown=null,this.originalBodyPad=null,this.scrollbarWidth=0,this.ignoreBackdropClick=!1,this.fixedContent=".navbar-fixed-top, .navbar-fixed-bottom",this.options.remote&&this.$element.find(".modal-content").load(this.options.remote,t.proxy(function(){this.$element.trigger("loaded.bs.modal")},this))};i.VERSION="3.4.1",i.TRANSITION_DURATION=300,i.BACKDROP_TRANSITION_DURATION=150,i.DEFAULTS={backdrop:!0,keyboard:!0,show:!0},i.prototype.toggle=function(t){return this.isShown?this.hide():this.show(t)},i.prototype.show=function(e){var n=this,o=t.Event("show.bs.modal",{relatedTarget:e});this.$element.trigger(o),this.isShown||o.isDefaultPrevented()||(this.isShown=!0,this.checkScrollbar(),this.setScrollbar(),this.$body.addClass("modal-open"),this.escape(),this.resize(),this.$element.on("click.dismiss.bs.modal",'[data-dismiss="modal"]',t.proxy(this.hide,this)),this.$dialog.on("mousedown.dismiss.bs.modal",function(){n.$element.one("mouseup.dismiss.bs.modal",function(e){t(e.target).is(n.$element)&&(n.ignoreBackdropClick=!0)})}),this.backdrop(function(){var o=t.support.transition&&n.$element.hasClass("fade");n.$element.parent().length||n.$element.appendTo(n.$body),n.$element.show().scrollTop(0),n.adjustDialog(),o&&n.$element[0].offsetWidth,n.$element.addClass("in"),n.enforceFocus();var s=t.Event("shown.bs.modal",{relatedTarget:e});o?n.$dialog.one("bsTransitionEnd",function(){n.$element.trigger("focus").trigger(s)}).emulateTransitionEnd(i.TRANSITION_DURATION):n.$element.trigger("focus").trigger(s)}))},i.prototype.hide=function(e){e&&e.preventDefault(),e=t.Event("hide.bs.modal"),this.$element.trigger(e),this.isShown&&!e.isDefaultPrevented()&&(this.isShown=!1,this.escape(),this.resize(),t(document).off("focusin.bs.modal"),this.$element.removeClass("in").off("click.dismiss.bs.modal").off("mouseup.dismiss.bs.modal"),this.$dialog.off("mousedown.dismiss.bs.modal"),t.support.transition&&this.$element.hasClass("fade")?this.$element.one("bsTransitionEnd",t.proxy(this.hideModal,this)).emulateTransitionEnd(i.TRANSITION_DURATION):this.hideModal())},i.prototype.enforceFocus=function(){t(document).off("focusin.bs.modal").on("focusin.bs.modal",t.proxy(function(t){document===t.target||this.$element[0]===t.target||this.$element.has(t.target).length||this.$element.trigger("focus")},this))},i.prototype.escape=function(){this.isShown&&this.options.keyboard?this.$element.on("keydown.dismiss.bs.modal",t.proxy(function(t){27==t.which&&this.hide()},this)):this.isShown||this.$element.off("keydown.dismiss.bs.modal")},i.prototype.resize=function(){this.isShown?t(window).on("resize.bs.modal",t.proxy(this.handleUpdate,this)):t(window).off("resize.bs.modal")},i.prototype.hideModal=function(){var t=this;this.$element.hide(),this.backdrop(function(){t.$body.removeClass("modal-open"),t.resetAdjustments(),t.resetScrollbar(),t.$element.trigger("hidden.bs.modal")})},i.prototype.removeBackdrop=function(){this.$backdrop&&this.$backdrop.remove(),this.$backdrop=null},i.prototype.backdrop=function(e){var n=this,o=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.options.backdrop){var s=t.support.transition&&o;if(this.$backdrop=t(document.createElement("div")).addClass("modal-backdrop "+o).appendTo(this.$body),this.$element.on("click.dismiss.bs.modal",t.proxy(function(t){return this.ignoreBackdropClick?void(this.ignoreBackdropClick=!1):void(t.target===t.currentTarget&&("static"==this.options.backdrop?this.$element[0].focus():this.hide()))},this)),s&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),!e)return;s?this.$backdrop.one("bsTransitionEnd",e).emulateTransitionEnd(i.BACKDROP_TRANSITION_DURATION):e()}else if(!this.isShown&&this.$backdrop){this.$backdrop.removeClass("in");var a=function(){n.removeBackdrop(),e&&e()};t.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one("bsTransitionEnd",a).emulateTransitionEnd(i.BACKDROP_TRANSITION_DURATION):a()}else e&&e()},i.prototype.handleUpdate=function(){this.adjustDialog()},i.prototype.adjustDialog=function(){var t=this.$element[0].scrollHeight>document.documentElement.clientHeight;this.$element.css({paddingLeft:!this.bodyIsOverflowing&&t?this.scrollbarWidth:"",paddingRight:this.bodyIsOverflowing&&!t?this.scrollbarWidth:""})},i.prototype.resetAdjustments=function(){this.$element.css({paddingLeft:"",paddingRight:""})},i.prototype.checkScrollbar=function(){var t=window.innerWidth;if(!t){var e=document.documentElement.getBoundingClientRect();t=e.right-Math.abs(e.left)}this.bodyIsOverflowing=document.body.clientWidth<t,this.scrollbarWidth=this.measureScrollbar()},i.prototype.setScrollbar=function(){var e=parseInt(this.$body.css("padding-right")||0,10);this.originalBodyPad=document.body.style.paddingRight||"";var i=this.scrollbarWidth;this.bodyIsOverflowing&&(this.$body.css("padding-right",e+i),t(this.fixedContent).each(function(e,n){var o=n.style.paddingRight,s=t(n).css("padding-right");t(n).data("padding-right",o).css("padding-right",parseFloat(s)+i+"px")}))},i.prototype.resetScrollbar=function(){this.$body.css("padding-right",this.originalBodyPad),t(this.fixedContent).each(function(e,i){var n=t(i).data("padding-right");t(i).removeData("padding-right"),i.style.paddingRight=n?n:""})},i.prototype.measureScrollbar=function(){var t=document.createElement("div");t.className="modal-scrollbar-measure",this.$body.append(t);var e=t.offsetWidth-t.clientWidth;return this.$body[0].removeChild(t),e};var n=t.fn.modal;t.fn.modal=e,t.fn.modal.Constructor=i,t.fn.modal.noConflict=function(){return t.fn.modal=n,this},t(document).on("click.bs.modal.data-api",'[data-toggle="modal"]',function(i){var n=t(this),o=n.attr("href"),s=n.attr("data-target")||o&&o.replace(/.*(?=#[^\s]+$)/,""),a=t(document).find(s),r=a.data("bs.modal")?"toggle":t.extend({remote:!/#/.test(o)&&o},a.data(),n.data());n.is("a")&&i.preventDefault(),a.one("show.bs.modal",function(t){t.isDefaultPrevented()||a.one("hidden.bs.modal",function(){n.is(":visible")&&n.trigger("focus")})}),e.call(a,r,this)})}(jQuery),+function(t){"use strict";function e(e){return this.each(function(){var n=t(this),o=n.data("bs.tab");o||n.data("bs.tab",o=new i(this)),"string"==typeof e&&o[e]()})}var i=function(e){this.element=t(e)};i.VERSION="3.4.1",i.TRANSITION_DURATION=150,i.prototype.show=function(){var e=this.element,i=e.closest("ul:not(.dropdown-menu)"),n=e.data("target");if(n||(n=e.attr("href"),n=n&&n.replace(/.*(?=#[^\s]*$)/,"")),!e.parent("li").hasClass("active")){var o=i.find(".active:last a"),s=t.Event("hide.bs.tab",{relatedTarget:e[0]}),a=t.Event("show.bs.tab",{relatedTarget:o[0]});if(o.trigger(s),e.trigger(a),!a.isDefaultPrevented()&&!s.isDefaultPrevented()){var r=t(document).find(n);this.activate(e.closest("li"),i),this.activate(r,r.parent(),function(){o.trigger({type:"hidden.bs.tab",relatedTarget:e[0]}),e.trigger({type:"shown.bs.tab",relatedTarget:o[0]})})}}},i.prototype.activate=function(e,n,o){function s(){a.removeClass("active").find("> .dropdown-menu > .active").removeClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded",!1),e.addClass("active").find('[data-toggle="tab"]').attr("aria-expanded",!0),r?(e[0].offsetWidth,e.addClass("in")):e.removeClass("fade"),e.parent(".dropdown-menu").length&&e.closest("li.dropdown").addClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded",!0),o&&o()}var a=n.find("> .active"),r=o&&t.support.transition&&(a.length&&a.hasClass("fade")||!!n.find("> .fade").length);a.length&&r?a.one("bsTransitionEnd",s).emulateTransitionEnd(i.TRANSITION_DURATION):s(),a.removeClass("in")};var n=t.fn.tab;t.fn.tab=e,t.fn.tab.Constructor=i,t.fn.tab.noConflict=function(){return t.fn.tab=n,this};var o=function(i){i.preventDefault(),e.call(t(this),"show")};t(document).on("click.bs.tab.data-api",'[data-toggle="tab"]',o).on("click.bs.tab.data-api",'[data-toggle="pill"]',o)}(jQuery),+function(t){"use strict";function e(){var t=document.createElement("bootstrap"),e={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(var i in e)if(void 0!==t.style[i])return{end:e[i]};return!1}t.fn.emulateTransitionEnd=function(e){var i=!1,n=this;t(this).one("bsTransitionEnd",function(){i=!0});var o=function(){i||t(n).trigger(t.support.transition.end)};return setTimeout(o,e),this},t(function(){t.support.transition=e(),t.support.transition&&(t.event.special.bsTransitionEnd={bindType:t.support.transition.end,delegateType:t.support.transition.end,handle:function(e){return t(e.target).is(this)?e.handleObj.handler.apply(this,arguments):void 0}})})}(jQuery);

{% if template == 'product' %}

	//////////////////////////////////////////////////////////////////////////////////
	// Cloud Zoom V1.0.2.5
	// (c) 2010 by R Cecco. <http://www.professorcloud.com>
	// with enhancements by Philipp Andreas <https://github.com/smurfy/cloud-zoom>
	//
	// MIT License
	//
	// Please retain this copyright header in all versions of the software
	//////////////////////////////////////////////////////////////////////////////////
	(function($){function format(e){for(var t=1;t<arguments.length;t++){e=e.replace("%"+(t-1),arguments[t])}return e}function CloudZoom(e,t){var n=$("img",e);var r;var i;var s=null;var o=null;var u=null;var a=null;var f=null;var l=null;var c;var h=0;var p,d;var v=0;var m=0;var g=0;var y=0;var b=0;var w,E;var S=this,x;setTimeout(function(){if(o===null){var t=e.width();e.parent().append(format('<div style="width:%0px;position:absolute;top:75%;left:%1px;text-align:center" class="cloud-zoom-loading" >Loading...</div>',t/3,t/2-t/6)).find(":last").css("opacity",.5)}},200);var T=function(){if(l!==null){l.remove();l=null}};this.removeBits=function(){if(u){u.remove();u=null}if(a){a.remove();a=null}if(f){f.remove();f=null}T();$(".cloud-zoom-loading",e.parent()).remove()};this.destroy=function(){e.data("zoom",null);if(o){o.unbind();o.remove();o=null}if(s){s.remove();s=null}this.removeBits()};this.fadedOut=function(){if(s){s.remove();s=null}this.removeBits()};this.controlLoop=function(){if(u){var e=w-n.offset().left-p*.5>>0;var r=E-n.offset().top-d*.5>>0;if(e<0){e=0}else if(e>n.outerWidth()-p){e=n.outerWidth()-p}if(r<0){r=0}else if(r>n.outerHeight()-d){r=n.outerHeight()-d}u.css({left:e,top:r});u.css("background-position",-e+"px "+ -r+"px");v=e/n.outerWidth()*c.width>>0;m=r/n.outerHeight()*c.height>>0;y+=(v-y)/t.smoothMove;g+=(m-g)/t.smoothMove;s.css("background-position",-(y>>0)+"px "+(-(g>>0)+"px"))}h=setTimeout(function(){S.controlLoop()},30)};this.init2=function(e,t){b++;if(t===1){c=e}if(b===2){this.init()}};this.init=function(){$(".cloud-zoom-loading",e.parent()).remove();o=e.parent().append(format("<div class='mousetrap' style='background-image:url(\""+t.transparentImage+"\");z-index:999;position:absolute;width:%0px;height:%1px;left:%2px;top:%3px;'></div>",n.outerWidth(),n.outerHeight(),0,0)).find(":last");o.bind("mousemove",this,function(e){w=e.pageX;E=e.pageY});o.bind("mouseleave",this,function(e){clearTimeout(h);if(u){u.fadeOut(299)}if(a){a.fadeOut(299)}if(f){f.fadeOut(299)}s.fadeOut(300,function(){S.fadedOut()});return false});o.bind("mouseenter",this,function(r){w=r.pageX;E=r.pageY;x=r.data;if(s){s.stop(true,false);s.remove()}var i=t.adjustX,h=t.adjustY;var v=n.outerWidth();var m=n.outerHeight();var g=t.zoomWidth;var y=t.zoomHeight;if(t.zoomWidth=="auto"){g=v}if(t.zoomHeight=="auto"){y=m}var b=e.parent();switch(t.position){case"top":h-=y;break;case"right":i+=v;break;case"bottom":h+=m;break;case"left":i-=g;break;case"inside":g=v;y=m;break;default:b=$("#"+t.position);if(!b.length){b=e;i+=v;h+=m}else{g=b.innerWidth();y=b.innerHeight()}}s=b.append(format('<div id="cloud-zoom-big" class="cloud-zoom-big" style="display:none;position:absolute;left:%0px;top:%1px;width:%2px;height:%3px;background-image:url(\'%4\');z-index:99;"></div>',i,h,g,y,c.src)).find(":last");if(n.attr("title")&&t.showTitle){s.append(format('<div class="cloud-zoom-title">%0</div>',n.attr("title"))).find(":last").css("opacity",t.titleOpacity)}var S=/(msie) ([\w.]+)/.exec(navigator.userAgent);if(S){if((S[1]||"")=="msie"&&(S[2]||"0")<7){l=$('<iframe frameborder="0" src="#"></iframe>').css({position:"absolute",left:i,top:h,zIndex:99,width:g,height:y}).insertBefore(s)}}s.fadeIn(500);if(u){u.remove();u=null}p=n.outerWidth()/c.width*s.width();d=n.outerHeight()/c.height*s.height();u=e.append(format("<div class = 'cloud-zoom-lens' style='display:none;z-index:98;position:absolute;width:%0px;height:%1px;'></div>",p,d)).find(":last");o.css("cursor",u.css("cursor"));var T=false;if(t.tint){u.css("background",'url("'+n.attr("src")+'")');a=e.append(format('<div style="display:none;position:absolute; left:0px; top:0px; width:%0px; height:%1px; background-color:%2;" />',n.outerWidth(),n.outerHeight(),t.tint)).find(":last");a.css("opacity",t.tintOpacity);T=true;a.fadeIn(500)}if(t.softFocus){u.css("background",'url("'+n.attr("src")+'")');f=e.append(format('<div style="position:absolute;display:none;top:2px; left:2px; width:%0px; height:%1px;" />',n.outerWidth()-2,n.outerHeight()-2,t.tint)).find(":last");f.css("background",'url("'+n.attr("src")+'")');f.css("opacity",.5);T=true;f.fadeIn(500)}if(!T){u.css("opacity",t.lensOpacity)}if(t.position!=="inside"){u.fadeIn(500)}x.controlLoop();return})};r=new Image;$(r).load(function(){S.init2(this,0)});r.src=n.attr("src");i=new Image;$(i).load(function(){S.init2(this,1)});i.src=e.attr("href")};$.fn.CloudZoom=function(options){try{document.execCommand("BackgroundImageCache",false,true)}catch(e){}this.each(function(){var relOpts,opts;eval("var	a = {"+$(this).attr("rel")+"}");relOpts=a;if($(this).is(".cloud-zoom")){opts=$.extend({},$.fn.CloudZoom.defaults,options);opts=$.extend({},opts,relOpts);$(this).css({position:"relative",display:"block"});$("img",$(this)).css({display:"block"});if(!$(this).parent().hasClass("cloud-zoom-wrap")&&opts.useWrapper){$(this).wrap('<div class="cloud-zoom-wrap"></div>')}$(this).data("zoom",new CloudZoom($(this),opts))}else if($(this).is(".cloud-zoom-gallery")){opts=$.extend({},relOpts,options);$(this).data("relOpts",opts);$(this).bind("click",$(this),function(e){var t=e.data.data("relOpts");$("#"+t.useZoom).data("zoom").destroy();$("#"+t.useZoom).attr("href",e.data.attr("href"));$("#"+t.useZoom+" img").attr("src",e.data.data("relOpts").smallImage);$("#"+e.data.data("relOpts").useZoom).CloudZoom();return false})}});return this};$.fn.CloudZoom.defaults={zoomWidth:"auto",zoomHeight:"auto",position:"right",transparentImage:".",useWrapper:true,tint:false,tintOpacity:.5,lensOpacity:.5,softFocus:false,smoothMove:3,showTitle:true,titleOpacity:.5,adjustX:0,adjustY:0};$(document).ready(function(){$(".cloud-zoom, .cloud-zoom-gallery").CloudZoom()});})(jQuery);


	/*Smart zoom*/

    function transitionEnd(){var e=document.createElement("bootstrap");var t={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(var n in t){if(e.style[n]!==undefined){return{end:t[n]}}}return false}(function(e){e.fn.smartZoom=function(t){function r(e){}function s(e,t){var r=n.data("smartZoomData");if(r.currentWheelDelta*t<0)r.currentWheelDelta=0;r.currentWheelDelta+=t;i.zoom(r.mouseWheelDeltaFactor*r.currentWheelDelta,{x:e.pageX,y:e.pageY})}function o(e){e.preventDefault()}function u(){var e=n.data("smartZoomData");if(e.settings.mouseMoveEnabled!=true||e.settings.moveCursorEnabled!=true)return;var t=S();var r=t.width/e.originalSize.width;if(parseInt(r*100)>parseInt(e.adjustedPosInfos.scale*100))n.css({cursor:"move"});else n.css({cursor:"default"})}function a(e){m(e.pageX,e.pageY)}function f(t){t.preventDefault();e(document).on("mousemove.smartZoom",l);e(document).bind("mouseup.smartZoom",c);var r=n.data("smartZoomData");r.moveCurrentPosition=new A(t.pageX,t.pageY);r.moveLastPosition=new A(t.pageX,t.pageY)}function l(e){var t=n.data("smartZoomData");if(t.mouseMoveForPan||!t.mouseMoveForPan&&t.moveCurrentPosition.x!=e.pageX&&t.moveCurrentPosition.y!=e.pageY){t.mouseMoveForPan=true;v(e.pageX,e.pageY,0,false)}}function c(t){var r=n.data("smartZoomData");if(r.mouseMoveForPan){r.mouseMoveForPan=false;if(r.moveLastPosition.distance(r.moveCurrentPosition)>4){var i=r.moveLastPosition.interpolate(r.moveCurrentPosition,-4);v(i.x,i.y,500,true)}else{v(r.moveLastPosition.x,r.moveLastPosition.y,0,true)}}else if(r.settings.zoomOnSimpleClick){m(t.pageX,t.pageY)}e(document).unbind("mousemove.smartZoom");e(document).unbind("mouseup.smartZoom")}function h(t){t.preventDefault();e(document).unbind("touchmove.smartZoom");e(document).unbind("touchend.smartZoom");e(document).bind("touchmove.smartZoom",p);e(document).bind("touchend.smartZoom",d);var r=t.originalEvent.touches;var i=r[0];var s=n.data("smartZoomData");s.touch.touchMove=false;s.touch.touchPinch=false;s.moveCurrentPosition=new A(i.pageX,i.pageY);s.moveLastPosition=new A(i.pageX,i.pageY);s.touch.lastTouchPositionArr=new Array;var o;var u=r.length;for(var a=0;a<u;++a){o=r[a];s.touch.lastTouchPositionArr.push(new A(o.pageX,o.pageY))}}function p(e){e.preventDefault();var t=n.data("smartZoomData");var r=e.originalEvent.touches;var s=r.length;var o=r[0];if(s==1&&!t.touch.touchPinch&&t.settings.touchMoveEnabled==true){if(!t.touch.touchMove){var u=t.touch.lastTouchPositionArr[0];if(u.distance(new A(o.pageX,o.pageY))<3){return}else t.touch.touchMove=true}v(o.pageX,o.pageY,0,false)}else if(s==2&&!t.touch.touchMove&&t.settings.pinchEnabled==true){t.touch.touchPinch=true;var a=r[1];var f=t.touch.lastTouchPositionArr[0];var l=t.touch.lastTouchPositionArr[1];var c=new A(o.pageX,o.pageY);var h=new A(a.pageX,a.pageY);var p=c.distance(h);var d=f.distance(l);var m=p-d;if(Math.abs(m)<3)return;var g=new A((c.x+h.x)/2,(c.y+h.y)/2);var y=S();var b=t.originalSize;var w=y.width/b.width;var E=p/d;var x=y.width*E/b.width;i.zoom(x-w,g,0);t.touch.lastTouchPositionArr[0]=c;t.touch.lastTouchPositionArr[1]=h}}function d(t){t.preventDefault();var r=t.originalEvent.touches.length;if(r==0){e(document).unbind("touchmove.smartZoom");e(document).unbind("touchend.smartZoom")}var i=n.data("smartZoomData");if(i.touch.touchPinch)return;if(i.touch.touchMove){if(i.moveLastPosition.distance(i.moveCurrentPosition)>2){var s=i.moveLastPosition.interpolate(i.moveCurrentPosition,-4);v(s.x,s.y,500,true)}}else{if(i.settings.dblTapEnabled==true&&i.touch.lastTouchEndTime!=0&&(new Date).getTime()-i.touch.lastTouchEndTime<400){var o=i.touch.lastTouchPositionArr[0];m(o.x,o.y)}i.touch.lastTouchEndTime=(new Date).getTime()}}function v(e,t,i,s){g(r.PAN);var o=n.data("smartZoomData");o.moveLastPosition.x=o.moveCurrentPosition.x;o.moveLastPosition.y=o.moveCurrentPosition.y;var u=n.offset();var a=S();var f=u.left+(e-o.moveCurrentPosition.x);var l=u.top+(t-o.moveCurrentPosition.y);var c=y(f,l,a.width,a.height);x(r.PAN,r.START,false);E(n,c.x,c.y,a.width,a.height,i,s==true?function(){x(r.PAN,r.END,false)}:null);o.moveCurrentPosition.x=e;o.moveCurrentPosition.y=t}function m(e,t){var r=n.data("smartZoomData");var s=r.originalSize;var o=S();var u=o.width/s.width;var a=r.adjustedPosInfos.scale;var f=parseFloat(r.settings.dblClickMaxScale);var l;if(u.toFixed(2)>f.toFixed(2)||Math.abs(f-u)>Math.abs(u-a)){l=f-u}else{l=a-u}i.zoom(l,{x:e,y:t})}function g(t){var r=n.data("smartZoomData");if(r.transitionObject){if(r.transitionObject.cssAnimHandler)n.off(e.support.transition,r.transitionObject.cssAnimTimer);var i=r.originalSize;var s=S();var o=new Object;o[r.transitionObject.transition]="all 0s";if(r.transitionObject.css3dSupported){o[r.transitionObject.transform]="translate3d("+s.x+"px, "+s.y+"px, 0) scale3d("+s.width/i.width+","+s.height/i.height+", 1)"}else{o[r.transitionObject.transform]="translateX("+s.x+"px) translateY("+s.y+"px) scale("+s.width/i.width+","+s.height/i.height+")"}n.css(o)}else{n.stop()}u();if(t!=null)x(t,"",true)}function y(e,t,r,i){var s=n.data("smartZoomData");var o=Math.min(s.adjustedPosInfos.top,t);o+=Math.max(0,s.adjustedPosInfos.top+s.adjustedPosInfos.height-(o+i));var u=Math.min(s.adjustedPosInfos.left,e);u+=Math.max(0,s.adjustedPosInfos.left+s.adjustedPosInfos.width-(u+r));return new A(u.toFixed(2),o.toFixed(2))}function b(e){n.unbind("load.smartZoom");i.init.apply(n,[e.data.arguments])}function w(){var e=n.data("smartZoomData");var t=e.containerDiv;var r=e.originalSize;var i=t.parent().offset();var s=C(e.settings.left,i.left,t.parent().width());var o=C(e.settings.top,i.top,t.parent().height());t.offset({left:s,top:o});t.width(N(e.settings.width,t.parent().width(),s-i.left));t.height(N(e.settings.height,t.parent().height(),o-i.top));var a=L(t);var f=Math.min(Math.min(a.width/r.width,a.height/r.height),1).toFixed(2);var l=r.width*f;var c=r.height*f;e.adjustedPosInfos={left:(a.width-l)/2+i.left,top:(a.height-c)/2+i.top,width:l,height:c,scale:f};g();E(n,e.adjustedPosInfos.left,e.adjustedPosInfos.top,l,c,0,function(){n.css("visibility","visible")});u()}function E(t,r,i,s,o,u,a){var f=n.data("smartZoomData");var l=f.containerDiv.offset();var c=r-l.left;var h=i-l.top;if(f.transitionObject!=null){var p=f.originalSize;var d=new Object;d[f.transitionObject.transform+"-origin"]="0 0";d[f.transitionObject.transition]="all "+u/1e3+"s ease-out";if(f.transitionObject.css3dSupported)d[f.transitionObject.transform]="translate3d("+c+"px, "+h+"px, 0) scale3d("+s/p.width+","+o/p.height+", 1)";else d[f.transitionObject.transform]="translateX("+c+"px) translateY("+h+"px) scale("+s/p.width+","+o/p.height+")";if(a!=null){f.transitionObject.cssAnimHandler=a;t.one(e.support.transition.end,f.transitionObject.cssAnimHandler)}t.css(d)}else{t.animate({"margin-left":c,"margin-top":h,width:s,height:o},{duration:u,easing:f.settings.easing,complete:function(){if(a!=null)a()}})}}function S(e){var t=n.data("smartZoomData");var r=n.width();var i=n.height();var s=n.offset();var o=parseInt(s.left);var u=parseInt(s.top);var a=t.containerDiv.offset();if(e!=true){o=parseInt(o)-a.left;u=parseInt(u)-a.top}if(t.transitionObject!=null){var f=n.css(t.transitionObject.transform);if(f&&f!=""&&f.search("matrix")!=-1){var l;var c;if(f.search("matrix3d")!=-1){c=f.replace("matrix3d(","").replace(")","").split(",");l=c[0]}else{c=f.replace("matrix(","").replace(")","").split(",");l=c[3];o=parseFloat(c[4]);u=parseFloat(c[5]);if(e){o=parseFloat(o)+a.left;u=parseFloat(u)+a.top}}r=l*r;i=l*i}}return{x:o,y:u,width:r,height:i}}function x(e,t,i){var s=n.data("smartZoomData");var o="";if(i==true&&s.currentActionType!=e){o=s.currentActionType+"_"+r.END;s.currentActionType="";s.currentActionStep=""}else{if(s.currentActionType!=e||s.currentActionStep==r.END){s.currentActionType=e;s.currentActionStep=r.START;o=s.currentActionType+"_"+s.currentActionStep}else if(s.currentActionType==e&&t==r.END){s.currentActionStep=r.END;o=s.currentActionType+"_"+s.currentActionStep;s.currentActionType="";s.currentActionStep=""}}if(o!=""){var u=jQuery.Event(o);u.targetRect=S(true);u.scale=u.targetRect.width/s.originalSize.width;n.trigger(u)}}function T(){var t=document.body||document.documentElement;var n=t.style;var r=["transition","WebkitTransition","MozTransition","MsTransition","OTransition"];var i=["transition","-webkit-transition","-moz-transition","-ms-transition","-o-transition"];var s=["transform","-webkit-transform","-moz-transform","-ms-transform","-o-transform"];var o=r.length;var u;for(var a=0;a<o;a++){if(n[r[a]]!=null){transformStr=s[a];var f=e('<div style="position:absolute;">Translate3d Test</div>');e("body").append(f);u=new Object;u[s[a]]="translate3d(20px,0,0)";f.css(u);css3dSupported=f.offset().left-e("body").offset().left==20;f.empty().remove();if(css3dSupported){return{transition:i[a],transform:s[a],css3dSupported:css3dSupported}}}}return null}function N(e,t,n){if(e.search&&e.search("%")!=-1)return(t-n)*(parseInt(e)/100);else return parseInt(e)}function C(e,t,n){if(e.search&&e.search("%")!=-1)return t+n*(parseInt(e)/100);else return t+parseInt(e)}function k(){w()}function L(e){var t=e.offset();if(!t)return null;var n=t.left;var r=t.top;return{x:n,y:r,width:e.outerWidth(),height:e.outerHeight()}}function A(e,t){this.x=e;this.y=t;this.toString=function(){return"(x="+this.x+", y="+this.y+")"};this.interpolate=function(e,t){var n=t*this.x+(1-t)*e.x;var r=t*this.y+(1-t)*e.y;return new A(n,r)};this.distance=function(e){return Math.sqrt(Math.pow(e.y-this.y,2)+Math.pow(e.x-this.x,2))}}var n=this;r.ZOOM="SmartZoom_ZOOM";r.PAN="SmartZoom_PAN";r.START="START";r.END="END";r.DESTROYED="SmartZoom_DESTROYED";var i={init:function(t){if(n.data("smartZoomData"))return;settings=e.extend({top:"0",left:"0",width:"100%",height:"100%",easing:"smartZoomEasing",initCallback:null,maxScale:3,dblClickMaxScale:1.8,mouseEnabled:true,scrollEnabled:true,dblClickEnabled:true,mouseMoveEnabled:true,moveCursorEnabled:true,adjustOnResize:true,touchEnabled:true,dblTapEnabled:true,zoomOnSimpleClick:false,pinchEnabled:true,touchMoveEnabled:true,containerBackground:"#FFFFFF",containerClass:""},t);var r=n.attr("style");var i="smartZoomContainer"+(new Date).getTime();var u=e('<div id="'+i+'" class="'+settings.containerClass+'"></div>');n.before(u);n.remove();u=e("#"+i);u.css({overflow:"hidden"});if(settings.containerClass=="")u.css({"background-color":settings.containerBackground});u.append(n);var l=new Object;l.lastTouchEndTime=0;l.lastTouchPositionArr=null;l.touchMove=false;l.touchPinch=false;n.data("smartZoomData",{settings:settings,containerDiv:u,originalSize:{width:n.width(),height:n.height()},originalPosition:n.offset(),transitionObject:T(),touch:l,mouseWheelDeltaFactor:.15,currentWheelDelta:0,adjustedPosInfos:null,moveCurrentPosition:null,moveLastPosition:null,mouseMoveForPan:false,currentActionType:"",initialStyles:r,currentActionStep:""});w();if(settings.touchEnabled==true)n.bind("touchstart.smartZoom",h);if(settings.mouseEnabled==true){if(settings.mouseMoveEnabled==true)n.bind("mousedown.smartZoom",f);if(settings.scrollEnabled==true){u.bind("mousewheel.smartZoom",s);u.bind("mousewheel.smartZoom DOMMouseScroll.smartZoom",o)}if(settings.dblClickEnabled==true&&settings.zoomOnSimpleClick==false)u.bind("dblclick.smartZoom",a)}document.ondragstart=function(){return false};if(settings.adjustOnResize==true)e(window).bind("resize.smartZoom",k);if(settings.initCallback!=null)settings.initCallback.apply(this,n)},zoom:function(e,t,i){var s=n.data("smartZoomData");var o;var a;if(!t){var f=L(s.containerDiv);o=f.x+f.width/2;a=f.y+f.height/2}else{o=t.x;a=t.y}g(r.ZOOM);var l=S(true);var c=s.originalSize;var h=l.width/c.width+e;h=Math.max(s.adjustedPosInfos.scale,h);h=Math.min(s.settings.maxScale,h);var p=c.width*h;var d=c.height*h;var v=o-l.x;var m=a-l.y;var b=p/l.width;var w=l.x-(v*b-v);var T=l.y-(m*b-m);var N=y(w,T,p,d);if(i==null)i=700;x(r.ZOOM,r.START,false);E(n,N.x,N.y,p,d,i,function(){s.currentWheelDelta=0;u();x(r.ZOOM,r.END,false)})},pan:function(e,t,i){if(e==null||t==null)return;if(i==null)i=700;var s=n.offset();var o=S();var u=y(s.left+e,s.top+t,o.width,o.height);if(u.x!=s.left||u.y!=s.top){g(r.PAN);x(r.PAN,r.START,false);E(n,u.x,u.y,o.width,o.height,i,function(){x(r.PAN,r.END,false)})}},destroy:function(){var t=n.data("smartZoomData");if(!t)return;g();var i=t.containerDiv;n.unbind("mousedown.smartZoom");n.bind("touchstart.smartZoom");i.unbind("mousewheel.smartZoom");i.unbind("dblclick.smartZoom");i.unbind("mousewheel.smartZoom DOMMouseScroll.smartZoom");e(window).unbind("resize.smartZoom");e(document).unbind("mousemove.smartZoom");e(document).unbind("mouseup.smartZoom");e(document).unbind("touchmove.smartZoom");e(document).unbind("touchend.smartZoom");n.css({cursor:"default"});i.before(n);E(n,t.originalPosition.left,t.originalPosition.top,t.originalSize.width,t.originalSize.height,5);n.removeData("smartZoomData");i.remove();n.attr("style",t.initialStyles);n.trigger(r.DESTROYED)},isPluginActive:function(){return n.data("smartZoomData")!=undefined}};if(i[t]){return i[t].apply(this,Array.prototype.slice.call(arguments,1))}else if(typeof t==="object"||!t){if(n[0].tagName.toLowerCase()=="img"&&!n[0].complete){n.bind("load.smartZoom",{arguments:arguments[0]},b)}else{i.init.apply(n,[arguments[0]])}}else{e.error("Method "+t+" does not exist on e-smartzoom jquery plugin")}}})(jQuery);(function(e){e.extend(e.easing,{smartZoomEasing:function(t,n,r,i,s){return e.easing["smartZoomOutQuad"](t,n,r,i,s)},smartZoomOutQuad:function(e,t,n,r,i){return-r*(t/=i)*(t-2)+n}})})(jQuery);(function(e){function t(t){var n=t||window.event,r=[].slice.call(arguments,1),i=0,s=true,o=0,u=0;t=e.event.fix(n);t.type="mousewheel";if(n.wheelDelta){i=n.wheelDelta/120}if(n.detail){i=-n.detail/3}u=i;if(n.axis!==undefined&&n.axis===n.HORIZONTAL_AXIS){u=0;o=-1*i}if(n.wheelDeltaY!==undefined){u=n.wheelDeltaY/120}if(n.wheelDeltaX!==undefined){o=-1*n.wheelDeltaX/120}r.unshift(t,i,o,u);return(e.event.dispatch||e.event.handle).apply(this,r)}var n=["DOMMouseScroll","mousewheel"];if(e.event.fixHooks){for(var r=n.length;r;){e.event.fixHooks[n[--r]]=e.event.mouseHooks}}e.event.special.mousewheel={setup:function(){if(this.addEventListener){for(var e=n.length;e;){this.addEventListener(n[--e],t,false)}}else{this.onmousewheel=t}},teardown:function(){if(this.removeEventListener){for(var e=n.length;e;){this.removeEventListener(n[--e],t,false)}}else{this.onmousewheel=null}}};e.fn.extend({mousewheel:function(e){return e?this.bind("mousewheel",e):this.trigger("mousewheel")},unmousewheel:function(e){return this.unbind("mousewheel",e)}})})(jQuery);$.fn.emulateTransitionEnd=function(e){var t=false,n=this;$(this).one($.support.transition.end,function(){t=true});var r=function(){if(!t)$(n).trigger($.support.transition.end)};setTimeout(r,e);return this};$(function(){$.support.transition=transitionEnd()})

{% endif %}
