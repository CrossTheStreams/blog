(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  Blog.Routers.Posts = (function(_super) {

    __extends(Posts, _super);

    Posts.name = 'Posts';

    function Posts() {
      return Posts.__super__.constructor.apply(this, arguments);
    }

    Posts.prototype.routes = {
      '': 'index',
      'posts/:id': 'show'
    };

    Posts.prototype.initialize = function() {
      this.collection = new Blog.Collections.Posts();
      return this.collection.fetch();
    };

    Posts.prototype.index = function() {
      var view;
      view = new Blog.Views.PostsIndex({
        collection: this.collection
      });
      return $('#feed').html(view.render().el);
    };

    Posts.prototype.show = function(id) {
      return alert("Post " + id);
    };

    return Posts;

  })(Backbone.Router);

}).call(this);
