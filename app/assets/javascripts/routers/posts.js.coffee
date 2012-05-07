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
    alert "Post #{id}"
    
