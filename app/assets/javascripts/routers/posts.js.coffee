class Blog.Routers.Posts extends Backbone.Router
  routes: 
    '': 'index'
    'posts/:id': 'show'
    'page/:id': 'page'

  initialize: ->
    @collection = new Blog.Collections.Posts()
    @collection.fetch()
  
  index: ->
    view = new Blog.Views.PostsIndex(collection: @collection)
    $('#feed').html(view.render().el)
    $('#prev').hide()
    $('#next').attr('href','page/2')
    $('#1').addClass('active')

  page: (id) ->
    collection = new Blog.Collections.Posts
    collection.fetch({data: {page: id}})
    view = new Blog.Views.PostsIndex(collection: collection)
    $('#feed').html(view.render().el)
    $('#' + id).addClass('active')
    $('#prev').attr('href', '/page/' + (id - 1))
    links = $('.p')

    if id%4 == 0
      $.map links, (a, i) ->
        num = (i + id - 3)
        a.href = 'page/' + num
        a.textContent = num
    else if id%3 == 0
      $.map links, (a, i) ->
        num = (i + id - 2)
        a.href = 'page/' + num
        a.textContent = num
    else if id%2 == 0
      $.map links, (a, i) ->
        num = (i + id - 1)
        a.href = 'page/' + num
        a.textContent = num
    else
      $.map links, (a, i) ->
        num = (i + id)
        a.href = 'page/' + num
        a.textContent = num
          
    
  show: (id) ->
    post = new Blog.Models.Post id: id
    view = new Blog.Views.PostsShow model: post
    collection = new Blog.Collections.Posts [post]
    post.fetch(post.fetch({error: -> 
      $('#feed').append('<h1>No Post Here!</h1>')}))
