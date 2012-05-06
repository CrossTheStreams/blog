class Blog.Routers.Posts extends Backbone.Router
  routes: 
    '': 'index'
    'posts/:id': 'show'
  
  index: ->
    view = new Blog.Views.PostsIndex()
    $('#feed').html(view.render().el)

  show: (id) ->
    alert "Post #{id}"
    
