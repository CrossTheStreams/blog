/* ===================================================
 * bootstrap-transition.js v2.0.4
 * http://twitter.github.com/bootstrap/javascript.html#transitions
 * ===================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
!function(e){e(function(){"use strict";e.support.transition=function(){var e=function(){var e=document.createElement("bootstrap"),t={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"otransitionend",msTransition:"MSTransitionEnd",transition:"transitionend"},n;for(n in t)if(e.style[n]!==undefined)return t[n]}();return e&&{end:e}}()})}(window.jQuery),!function(e){"use strict";function r(){e(t).parent().removeClass("open")}var t='[data-toggle="dropdown"]',n=function(t){var n=e(t).on("click.dropdown.data-api",this.toggle);e("html").on("click.dropdown.data-api",function(){n.parent().removeClass("open")})};n.prototype={constructor:n,toggle:function(t){var n=e(this),i,s,o;if(n.is(".disabled, :disabled"))return;return s=n.attr("data-target"),s||(s=n.attr("href"),s=s&&s.replace(/.*(?=#[^\s]*$)/,"")),i=e(s),i.length||(i=n.parent()),o=i.hasClass("open"),r(),o||i.toggleClass("open"),!1}},e.fn.dropdown=function(t){return this.each(function(){var r=e(this),i=r.data("dropdown");i||r.data("dropdown",i=new n(this)),typeof t=="string"&&i[t].call(r)})},e.fn.dropdown.Constructor=n,e(function(){e("html").on("click.dropdown.data-api",r),e("body").on("click.dropdown",".dropdown form",function(e){e.stopPropagation()}).on("click.dropdown.data-api",t,n.prototype.toggle)})}(window.jQuery),!function(e){"use strict";var t=function(t,n){this.$element=e(t),this.options=e.extend({},e.fn.typeahead.defaults,n),this.matcher=this.options.matcher||this.matcher,this.sorter=this.options.sorter||this.sorter,this.highlighter=this.options.highlighter||this.highlighter,this.updater=this.options.updater||this.updater,this.$menu=e(this.options.menu).appendTo("body"),this.source=this.options.source,this.shown=!1,this.listen()};t.prototype={constructor:t,select:function(){var e=this.$menu.find(".active").attr("data-value");return this.$element.val(this.updater(e)).change(),this.hide()},updater:function(e){return e},show:function(){var t=e.extend({},this.$element.offset(),{height:this.$element[0].offsetHeight});return this.$menu.css({top:t.top+t.height,left:t.left}),this.$menu.show(),this.shown=!0,this},hide:function(){return this.$menu.hide(),this.shown=!1,this},lookup:function(t){var n=this,r,i;return this.query=this.$element.val(),this.query?(r=e.grep(this.source,function(e){return n.matcher(e)}),r=this.sorter(r),r.length?this.render(r.slice(0,this.options.items)).show():this.shown?this.hide():this):this.shown?this.hide():this},matcher:function(e){return~e.toLowerCase().indexOf(this.query.toLowerCase())},sorter:function(e){var t=[],n=[],r=[],i;while(i=e.shift())i.toLowerCase().indexOf(this.query.toLowerCase())?~i.indexOf(this.query)?n.push(i):r.push(i):t.push(i);return t.concat(n,r)},highlighter:function(e){var t=this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,"\\$&");return e.replace(new RegExp("("+t+")","ig"),function(e,t){return"<strong>"+t+"</strong>"})},render:function(t){var n=this;return t=e(t).map(function(t,r){return t=e(n.options.item).attr("data-value",r),t.find("a").html(n.highlighter(r)),t[0]}),t.first().addClass("active"),this.$menu.html(t),this},next:function(t){var n=this.$menu.find(".active").removeClass("active"),r=n.next();r.length||(r=e(this.$menu.find("li")[0])),r.addClass("active")},prev:function(e){var t=this.$menu.find(".active").removeClass("active"),n=t.prev();n.length||(n=this.$menu.find("li").last()),n.addClass("active")},listen:function(){this.$element.on("blur",e.proxy(this.blur,this)).on("keypress",e.proxy(this.keypress,this)).on("keyup",e.proxy(this.keyup,this)),(e.browser.webkit||e.browser.msie||e.browser.mozilla)&&this.$element.on("keydown",e.proxy(this.keypress,this)),this.$menu.on("click",e.proxy(this.click,this)).on("mouseenter","li",e.proxy(this.mouseenter,this))},keyup:function(e){switch(e.keyCode){case 40:case 38:break;case 9:case 13:if(!this.shown)return;this.select();break;case 27:if(!this.shown)return;this.hide();break;default:this.lookup()}e.stopPropagation(),e.preventDefault()},keypress:function(e){if(!this.shown)return;switch(e.keyCode){case 9:case 13:case 27:e.preventDefault();break;case 38:if(e.type!="keydown")break;e.preventDefault(),this.prev();break;case 40:if(e.type!="keydown")break;e.preventDefault(),this.next()}e.stopPropagation()},blur:function(e){var t=this;setTimeout(function(){t.hide()},150)},click:function(e){e.stopPropagation(),e.preventDefault(),this.select()},mouseenter:function(t){this.$menu.find(".active").removeClass("active"),e(t.currentTarget).addClass("active")}},e.fn.typeahead=function(n){return this.each(function(){var r=e(this),i=r.data("typeahead"),s=typeof n=="object"&&n;i||r.data("typeahead",i=new t(this,s)),typeof n=="string"&&i[n]()})},e.fn.typeahead.defaults={source:[],items:8,menu:'<ul class="typeahead dropdown-menu"></ul>',item:'<li><a href="#"></a></li>'},e.fn.typeahead.Constructor=t,e(function(){e("body").on("focus.typeahead.data-api",'[data-provide="typeahead"]',function(t){var n=e(this);if(n.data("typeahead"))return;t.preventDefault(),n.typeahead(n.data())})})}(window.jQuery),function(){window.Blog={Models:{},Collections:{},Views:{},Routers:{},init:function(){return new Blog.Routers.Posts,Backbone.history.start({pushState:!0})}},$(document).ready(function(){var e;return Blog.init(),e=$("#blog-search"),e.focus()}),$("#tag-cloud").click(function(e){return e.preventDefault(),$(this).tab("show")})}.call(this),function(){this.JST||(this.JST={}),this.JST["posts/index"]=function(e){e||(e={});var t=[],n=function(e){var n=t,r;return t=[],e.call(this),r=t.join(""),t=n,i(r)},r=function(e){return e&&e.ecoSafe?e:typeof e!="undefined"&&e!=null?o(e):""},i,s=e.safe,o=e.escape;return i=e.safe=function(e){if(e&&e.ecoSafe)return e;if(typeof e=="undefined"||e==null)e="";var t=new String(e);return t.ecoSafe=!0,t},o||(o=e.escape=function(e){return(""+e).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;")}),function(){(function(){var e,i,s,o;o=this.posts.models;for(i=0,s=o.length;i<s;i++)e=o[i],t.push('\n  <div class="post" id="post-'),t.push(r(e.get("id"))),t.push('">\n    <h1><a href="/posts/'),t.push(r(e.get("id"))),t.push('">'),t.push(r(e.get("title"))),t.push('</a></h1>\n    <div class="tags"><strong>Tags:</strong> \n      '),t.push(e.get("keywords").map(function(e){return" <a href='/tag/"+e.name+"'>"+e.name+"</a>"})),t.push("\n    </div>\n    <h3>"),t.push(r(e.get("date_published"))),t.push('</h3>\n    <div class="content">'),t.push(e.get("content")),t.push('</div>\n    <h3 class="comments-link"><a href="/posts/'),t.push(r(e.get("id"))),t.push('">Post and Read Comments</a></h3>\n  </div>\n');t.push("\n"),jQuery.ready(function(){return n(function(){t.push("\n  ");if(this.posts.models.length===0)return t.push("\n    <h1>No posts here...</h1>\n  ");if(this.posts.models.length===0)return t.push("\n    <h1>No posts match your search...</h1>\n\n\n\n")})})}).call(this)}.call(e),e.safe=s,e.escape=o,t.join("")}}.call(this),function(){this.JST||(this.JST={}),this.JST["posts/show"]=function(e){e||(e={});var t=[],n=function(e){var n=t,r;return t=[],e.call(this),r=t.join(""),t=n,i(r)},r=function(e){return e&&e.ecoSafe?e:typeof e!="undefined"&&e!=null?o(e):""},i,s=e.safe,o=e.escape;return i=e.safe=function(e){if(e&&e.ecoSafe)return e;if(typeof e=="undefined"||e==null)e="";var t=new String(e);return t.ecoSafe=!0,t},o||(o=e.escape=function(e){return(""+e).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;")}),function(){(function(){t.push('<div class="post" id="post-'),t.push(r(this.post.get("id"))),t.push('">\n  <h1><a href="/posts/'),t.push(r(this.post.get("id"))),t.push('">'),t.push(r(this.post.get("title"))),t.push('</a></h1>\n  <div class="tags">\n    <strong>Tags:</strong>\n    '),t.push(this.post.attributes.keywords.map(function(e){return" <a href='/tag/"+e+"'>"+e+"</a>"})),t.push("\n  </div>\n  <h3>"),t.push(r(this.post.get("date_published"))),t.push("</h3>\n  <div class='content'>"),t.push(this.post.get("content")),t.push("</div>\n  <div id=\"disqus_thread\"><a name=\"comments\"</div>\n  <script type=\"text/javascript\">\n      /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */\n      var disqus_shortname = 'hautaulogy'; // required: replace example with your forum shortname\n\n      /* * * DON'T EDIT BELOW THIS LINE * * */\n      (function() {\n          var dsq = document.createElement('script'); \n              dsq.type = 'text/javascript'; dsq.async = true;\n              dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';\n              (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);\n      })();\n  </script>\n  <noscript>Please enable JavaScript to view the <a href=\"http://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>\n  <a href=\"http://disqus.com\" class=\"dsq-brlink\">comments powered by <span class=\"logo-disqus\">Disqus</span></a> \n</div>\n")}).call(this)}.call(e),e.safe=s,e.escape=o,t.join("")}}.call(this),function(){var e={}.hasOwnProperty,t=function(t,n){function i(){this.constructor=t}for(var r in n)e.call(n,r)&&(t[r]=n[r]);return i.prototype=n.prototype,t.prototype=new i,t.__super__=n.prototype,t};Blog.Models.Post=function(e){function n(){return n.__super__.constructor.apply(this,arguments)}return t(n,e),n}(Backbone.Model),Blog.Models.Tag=function(e){function n(){return n.__super__.constructor.apply(this,arguments)}return t(n,e),n}(Backbone.Model)}.call(this),function(){var e={}.hasOwnProperty,t=function(t,n){function i(){this.constructor=t}for(var r in n)e.call(n,r)&&(t[r]=n[r]);return i.prototype=n.prototype,t.prototype=new i,t.__super__=n.prototype,t};Blog.Collections.Posts=function(e){function n(){return n.__super__.constructor.apply(this,arguments)}return t(n,e),n.prototype.url="/api/posts",n.prototype.model=Blog.Models.Post,n}(Backbone.Collection),Blog.Collections.Tags=function(e){function n(){return n.__super__.constructor.apply(this,arguments)}return t(n,e),n.prototype.url="api/tags",n.prototype.model=Blog.Models.Tag,n}(Backbone.Collection)}.call(this),function(){var e={}.hasOwnProperty,t=function(t,n){function i(){this.constructor=t}for(var r in n)e.call(n,r)&&(t[r]=n[r]);return i.prototype=n.prototype,t.prototype=new i,t.__super__=n.prototype,t};Blog.Views.PostsIndex=function(e){function n(){return n.__super__.constructor.apply(this,arguments)}return t(n,e),n.prototype.template=JST["posts/index"],n.prototype.initialize=function(){return this.collection.on("reset",this.render,this)},n.prototype.render=function(){return $(this.el).html(this.template({posts:this.collection})),Rainbow.color(),this},n}(Backbone.View)}.call(this),function(){var e={}.hasOwnProperty,t=function(t,n){function i(){this.constructor=t}for(var r in n)e.call(n,r)&&(t[r]=n[r]);return i.prototype=n.prototype,t.prototype=new i,t.__super__=n.prototype,t};Blog.Views.PostsShow=function(e){function n(){return n.__super__.constructor.apply(this,arguments)}return t(n,e),n.prototype.el="#feed",n.prototype.template=JST["posts/show"],n.prototype.initialize=function(){return this.model.bind("change",this.render,this)},n.prototype.render=function(){return $(this.el).html(this.template({post:this.model})),this},n}(Backbone.View)}.call(this),function(){var e={}.hasOwnProperty,t=function(t,n){function i(){this.constructor=t}for(var r in n)e.call(n,r)&&(t[r]=n[r]);return i.prototype=n.prototype,t.prototype=new i,t.__super__=n.prototype,t};Blog.Routers.Posts=function(e){function r(){return r.__super__.constructor.apply(this,arguments)}var n;return t(r,e),n=Blog.Collections.Posts.prototype.url,r.prototype.routes={"":"index","posts/:id":"show","page/:pageNumber":"page","search/:query":"search","tag/:keyword":"tag"},r.prototype.initialize=function(){return this.collection=new Blog.Collections.Posts},r.prototype.index=function(){var e;return this.collection.fetch(),e=new Blog.Views.PostsIndex({collection:this.collection}),$("#feed").html(e.render().el),$("#prev").css("visibility","hidden"),$("#next").attr("href","page/2"),$("#1").addClass("active"),$(".a")[0].style.borderLeftWidth="1px"},r.prototype.page=function(e){var t,n,r,i;return t=new Blog.Collections.Posts,t.fetch({data:{page:e}}),i=new Blog.Views.PostsIndex({collection:t}),$("#feed").html(i.render().el),$("#prev").attr("href","/page/"+(e-1)),r=$(".a"),e=parseInt(e),e<=1&&(e=1,this.navigate(""),$(".a")[0].style.borderLeftWidth="1px",r.each(function(t,n){return n.href="/page/"+e})),e>2?(n=e-2,$("#3").addClass("active"),r.each(function(e,t){return t.href="/page/"+(n+e)})):(n=1,$("#"+e).addClass("active"),r.each(function(e,t){return t.href="/page/"+(n+e)})),$("#pre").attr("href",e-1),$("#next").attr("href",e+1)},r.prototype.show=function(e){var t,n,r,i,s,o;return i=new Blog.Models.Post({id:e}),o=new Blog.Views.PostsShow({model:i}),t=new Blog.Collections.Posts([i]),i.fetch(),r=$(".a"),s=parseInt(e),$("#prev").attr("href","/posts/"+(s-1)),s===1&&($(".a")[0].style.borderLeftWidth="1px",$("#prev").css("visibility","hidden"),$("#1").addClass("active"),r.each(function(e,t){return t.href="/posts/"+s})),s>2?(n=s-2,$("#3").addClass("active"),r.each(function(e,t){return t.href="/posts/"+(s-e)})):(n=1,$("#"+s).addClass("active"),r.each(function(e,t){return t.href="/posts/"+(s-e)})),$("#next").attr("href",s+1)},r.prototype.search=function(e){var t,r;return t=new Blog.Collections.Posts,t.fetch({url:n+"/search/"+e}),r=new Blog.Views.PostsIndex({collection:t}),$("#feed").html(r.render().el)},r.prototype.tag=function(e){var t,r;return t=new Blog.Collections.Posts,t.fetch({url:n+"/tag/"+e}),r=new Blog.Views.PostsIndex({collection:t}),$("#feed").html(r.render().el)},r}(Backbone.Router)}.call(this);