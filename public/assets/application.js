(function() {
  this.JST || (this.JST = {});
  this.JST["posts/index"] = function(__obj) {
    if (!__obj) __obj = {};
    var __out = [], __capture = function(callback) {
      var out = __out, result;
      __out = [];
      callback.call(this);
      result = __out.join('');
      __out = out;
      return __safe(result);
    }, __sanitize = function(value) {
      if (value && value.ecoSafe) {
        return value;
      } else if (typeof value !== 'undefined' && value != null) {
        return __escape(value);
      } else {
        return '';
      }
    }, __safe, __objSafe = __obj.safe, __escape = __obj.escape;
    __safe = __obj.safe = function(value) {
      if (value && value.ecoSafe) {
        return value;
      } else {
        if (!(typeof value !== 'undefined' && value != null)) value = '';
        var result = new String(value);
        result.ecoSafe = true;
        return result;
      }
    };
    if (!__escape) {
      __escape = __obj.escape = function(value) {
        return ('' + value)
          .replace(/&/g, '&amp;')
          .replace(/</g, '&lt;')
          .replace(/>/g, '&gt;')
          .replace(/"/g, '&quot;');
      };
    }
    (function() {
      (function() {
        var post, _i, _len, _ref;
      
        _ref = this.posts.models;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          post = _ref[_i];
          __out.push('\n  <div class="post" id="post-');
          __out.push(__sanitize(post.get('id')));
          __out.push('">\n    <h1><a href="/posts/');
          __out.push(__sanitize(post.get('id')));
          __out.push('">');
          __out.push(__sanitize(post.get('title')));
          __out.push('</a></h1>\n    <div class="tags"><strong>Tags:</strong> \n      ');
          __out.push(post.get('keywords').map(function(d) {
            return " " + "<a href='/tag/" + d.name + "'>" + d.name + "</a>";
          }));
          __out.push('\n    </div>\n    <h3>');
          __out.push(__sanitize(post.get('date_published')));
          __out.push('</h3>\n    <div class="content">');
          __out.push(post.get('content'));
          __out.push('</div>\n    <h3 class="comments-link"><a href="/posts/');
          __out.push(__sanitize(post.get('id')));
          __out.push('">Post and Read Comments</a></h3>\n  </div>\n');
        }
      
        __out.push('\n');
      
        jQuery.ready(function() {
          return __capture(function() {
            __out.push('\n  ');
            if (this.posts.models.length === 0) {
              return __out.push('\n    <h1>No posts here...</h1>\n  ');
            } else if (this.posts.models.length === 0) {
              return __out.push('\n    <h1>No posts match your search...</h1>\n\n\n\n');
            }
          });
        });
      
      }).call(this);
      
    }).call(__obj);
    __obj.safe = __objSafe, __obj.escape = __escape;
    return __out.join('');
  };
}).call(this);
(function() {
  this.JST || (this.JST = {});
  this.JST["posts/show"] = function(__obj) {
    if (!__obj) __obj = {};
    var __out = [], __capture = function(callback) {
      var out = __out, result;
      __out = [];
      callback.call(this);
      result = __out.join('');
      __out = out;
      return __safe(result);
    }, __sanitize = function(value) {
      if (value && value.ecoSafe) {
        return value;
      } else if (typeof value !== 'undefined' && value != null) {
        return __escape(value);
      } else {
        return '';
      }
    }, __safe, __objSafe = __obj.safe, __escape = __obj.escape;
    __safe = __obj.safe = function(value) {
      if (value && value.ecoSafe) {
        return value;
      } else {
        if (!(typeof value !== 'undefined' && value != null)) value = '';
        var result = new String(value);
        result.ecoSafe = true;
        return result;
      }
    };
    if (!__escape) {
      __escape = __obj.escape = function(value) {
        return ('' + value)
          .replace(/&/g, '&amp;')
          .replace(/</g, '&lt;')
          .replace(/>/g, '&gt;')
          .replace(/"/g, '&quot;');
      };
    }
    (function() {
      (function() {
      
        __out.push('<div class="post" id="post-');
      
        __out.push(__sanitize(this.post.get('id')));
      
        __out.push('">\n  <h1><a href="/posts/');
      
        __out.push(__sanitize(this.post.get('id')));
      
        __out.push('">');
      
        __out.push(__sanitize(this.post.get('title')));
      
        __out.push('</a></h1>\n  <div class="tags">\n    <strong>Tags:</strong>\n    ');
      
        __out.push(this.post.attributes.keywords.map(function(d) {
          return " " + "<a href='/tag/" + d + "'>" + d + "</a>";
        }));
      
        __out.push('\n  </div>\n  <h3>');
      
        __out.push(__sanitize(this.post.get('date_published')));
      
        __out.push('</h3>\n  <div class=\'content\'>');
      
        __out.push(this.post.get('content'));
      
        __out.push('</div>\n  <div id="disqus_thread"><a name="comments"</div>\n  <script type="text/javascript">\n      /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */\n      var disqus_shortname = \'hautaulogy\'; // required: replace example with your forum shortname\n\n      /* * * DON\'T EDIT BELOW THIS LINE * * */\n      (function() {\n          var dsq = document.createElement(\'script\'); \n              dsq.type = \'text/javascript\'; dsq.async = true;\n              dsq.src = \'http://\' + disqus_shortname + \'.disqus.com/embed.js\';\n              (document.getElementsByTagName(\'head\')[0] || document.getElementsByTagName(\'body\')[0]).appendChild(dsq);\n      })();\n  </script>\n  <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>\n  <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a> \n</div>\n');
      
      }).call(this);
      
    }).call(__obj);
    __obj.safe = __objSafe, __obj.escape = __escape;
    return __out.join('');
  };
}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Blog.Models.Post = (function(_super) {

    __extends(Post, _super);

    function Post() {
      return Post.__super__.constructor.apply(this, arguments);
    }

    return Post;

  })(Backbone.Model);

  Blog.Models.Tag = (function(_super) {

    __extends(Tag, _super);

    function Tag() {
      return Tag.__super__.constructor.apply(this, arguments);
    }

    return Tag;

  })(Backbone.Model);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Blog.Collections.Posts = (function(_super) {

    __extends(Posts, _super);

    function Posts() {
      return Posts.__super__.constructor.apply(this, arguments);
    }

    Posts.prototype.url = '/api/posts';

    Posts.prototype.model = Blog.Models.Post;

    return Posts;

  })(Backbone.Collection);

  Blog.Collections.Tags = (function(_super) {

    __extends(Tags, _super);

    function Tags() {
      return Tags.__super__.constructor.apply(this, arguments);
    }

    Tags.prototype.url = 'api/tags';

    Tags.prototype.model = Blog.Models.Tag;

    return Tags;

  })(Backbone.Collection);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Blog.Views.PostsIndex = (function(_super) {

    __extends(PostsIndex, _super);

    function PostsIndex() {
      return PostsIndex.__super__.constructor.apply(this, arguments);
    }

    PostsIndex.prototype.template = JST['posts/index'];

    PostsIndex.prototype.initialize = function() {
      return this.collection.on('reset', this.render, this);
    };

    PostsIndex.prototype.render = function() {
      $(this.el).html(this.template({
        posts: this.collection
      }));
      Rainbow.color();
      return this;
    };

    return PostsIndex;

  })(Backbone.View);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Blog.Views.PostsShow = (function(_super) {

    __extends(PostsShow, _super);

    function PostsShow() {
      return PostsShow.__super__.constructor.apply(this, arguments);
    }

    PostsShow.prototype.el = '#feed';

    PostsShow.prototype.template = JST['posts/show'];

    PostsShow.prototype.initialize = function() {
      return this.model.bind('change', this.render, this);
    };

    PostsShow.prototype.render = function() {
      $(this.el).html(this.template({
        post: this.model
      }));
      return this;
    };

    return PostsShow;

  })(Backbone.View);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Blog.Routers.Posts = (function(_super) {
    var api_url;

    __extends(Posts, _super);

    function Posts() {
      return Posts.__super__.constructor.apply(this, arguments);
    }

    api_url = Blog.Collections.Posts.prototype.url;

    Posts.prototype.routes = {
      '': 'index',
      'posts/:id': 'show',
      'page/:pageNumber': 'page',
      'search/:query': 'search',
      'tag/:keyword': 'tag'
    };

    Posts.prototype.initialize = function() {
      return this.collection = new Blog.Collections.Posts();
    };

    Posts.prototype.index = function() {
      var view;
      this.collection.fetch();
      view = new Blog.Views.PostsIndex({
        collection: this.collection
      });
      $('#feed').html(view.render().el);
      $('#prev').css('visibility', 'hidden');
      $('#next').attr('href', 'page/2');
      $('#1').addClass('active');
      return $(".a")[0].style.borderLeftWidth = "1px";
    };

    Posts.prototype.page = function(pageNumber) {
      var collection, link_num, links, view;
      collection = new Blog.Collections.Posts;
      collection.fetch({
        data: {
          page: pageNumber
        }
      });
      view = new Blog.Views.PostsIndex({
        collection: collection
      });
      $('#feed').html(view.render().el);
      $('#prev').attr('href', '/page/' + (pageNumber - 1));
      links = $('.a');
      pageNumber = parseInt(pageNumber);
      if (pageNumber <= 1) {
        pageNumber = 1;
        this.navigate("");
        $(".a")[0].style.borderLeftWidth = "1px";
        links.each(function(i, a) {
          return a.href = '/page/' + pageNumber;
        });
      }
      if (pageNumber > 2) {
        link_num = pageNumber - 2;
        $('#3').addClass('active');
        links.each(function(i, a) {
          return a.href = '/page/' + (link_num + i);
        });
      } else {
        link_num = 1;
        $('#' + pageNumber).addClass('active');
        links.each(function(i, a) {
          return a.href = '/page/' + (link_num + i);
        });
      }
      $('#pre').attr('href', pageNumber - 1);
      return $('#next').attr('href', pageNumber + 1);
    };

    Posts.prototype.show = function(id) {
      var collection, link_num, links, post, postNumber, view;
      post = new Blog.Models.Post({
        id: id
      });
      view = new Blog.Views.PostsShow({
        model: post
      });
      collection = new Blog.Collections.Posts([post]);
      post.fetch();
      links = $('.a');
      postNumber = parseInt(id);
      $('#prev').attr('href', '/posts/' + (postNumber - 1));
      if (postNumber === 1) {
        $(".a")[0].style.borderLeftWidth = "1px";
        $('#prev').css('visibility', 'hidden');
        $('#1').addClass('active');
        links.each(function(i, a) {
          return a.href = '/posts/' + postNumber;
        });
      }
      if (postNumber > 2) {
        link_num = postNumber - 2;
        $('#3').addClass('active');
        links.each(function(i, a) {
          return a.href = '/posts/' + (postNumber - i);
        });
      } else {
        link_num = 1;
        $('#' + postNumber).addClass('active');
        links.each(function(i, a) {
          return a.href = '/posts/' + (postNumber - i);
        });
      }
      return $('#next').attr('href', postNumber + 1);
    };

    Posts.prototype.search = function(query) {
      var collection, view;
      collection = new Blog.Collections.Posts;
      collection.fetch({
        url: api_url + '/search/' + query
      });
      view = new Blog.Views.PostsIndex({
        collection: collection
      });
      return $('#feed').html(view.render().el);
    };

    Posts.prototype.tag = function(keyword) {
      var collection, view;
      collection = new Blog.Collections.Posts;
      collection.fetch({
        url: api_url + '/tag/' + keyword
      });
      view = new Blog.Views.PostsIndex({
        collection: collection
      });
      return $('#feed').html(view.render().el);
    };

    return Posts;

  })(Backbone.Router);

}).call(this);
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//






;
