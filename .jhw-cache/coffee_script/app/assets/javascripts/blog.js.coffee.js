(function() {

  window.Blog = {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    init: function() {
      new Blog.Routers.Posts;
      return Backbone.history.start({
        pushState: true
      });
    }
  };

  $(document).ready(function() {
    return Blog.init();
  });

}).call(this);