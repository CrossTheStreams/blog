(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  Blog.Views.PostsIndex = (function(_super) {

    __extends(PostsIndex, _super);

    PostsIndex.name = 'PostsIndex';

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
      return this;
    };

    return PostsIndex;

  })(Backbone.View);

}).call(this);
