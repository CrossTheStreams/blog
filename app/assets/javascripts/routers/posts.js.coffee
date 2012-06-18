class Blog.Routers.Posts extends Backbone.Router
  routes: 
    '': 'index'
    'posts/:id': 'show'

  initialize: ->
    @collection = new Blog.Collections.Posts()
    @collection.fetch()
  
  index: ->
    view = new Blog.Views.PostsIndex(collection: @collection)
    $('#feed').html(view.render().el)

  show: (id) ->
    post = new Blog.Models.Post id: id
    view = new Blog.Views.PostsShow model: post
    collection = new Blog.Collections.Posts [post]
    post.fetch(post.fetch({error: -> 
      $('#feed').append('<h1>No Post Here!</h1>')}))
