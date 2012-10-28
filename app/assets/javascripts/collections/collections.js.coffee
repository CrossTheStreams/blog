class Blog.Collections.Posts extends Backbone.Collection

  url: '/api/posts'
  model: Blog.Models.Post

class Blog.Collections.Tags extends Backbone.Collection

  url: 'api/tags'
  model: Blog.Models.Tag

  
