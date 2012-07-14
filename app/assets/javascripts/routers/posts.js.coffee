class Blog.Routers.Posts extends Backbone.Router
  routes: 
    '': 'index'
    'posts/:id': 'show'
    'page/:pageNumber': 'page'

  initialize: ->
    @collection = new Blog.Collections.Posts()
    @collection.fetch()
  
  index: ->
    view = new Blog.Views.PostsIndex(collection: @collection)
    $('#feed').html(view.render().el)
    $('#prev').css('visibility','hidden')
    $('#next').attr('href','page/2')
    $('#1').addClass('active')
    $(".a")[0].style.borderLeftWidth = "1px"

  page: (pageNumber) ->
    collection = new Blog.Collections.Posts
    collection.fetch({data: {page: pageNumber}})
    view = new Blog.Views.PostsIndex(collection: collection)
    $('#feed').html(view.render().el)
    $('#prev').attr('href', '/page/' + (pageNumber - 1))
    links = $('.a')
    pageNumber = parseInt(pageNumber)
    if pageNumber == 1
       @navigate("") 
       $(".a")[0].style.borderLeftWidth = "1px"
    if pageNumber > 2
      link_num = pageNumber - 2
      $('#3').addClass('active')
    else 
      link_num = 1
      $('#' + pageNumber).addClass('active')
    for link in links
      link.textContent = link_num + _i
    $('#next').attr('href', (pageNumber + 1))

        
  show: (id) ->
    post = new Blog.Models.Post id: id
    view = new Blog.Views.PostsShow model: post
    collection = new Blog.Collections.Posts [post]
    post.fetch(post.fetch({error: -> 
      $('#feed').append('<h1>No Post Here!</h1>')}))
    links = $('.a')
    postNumber = parseInt(id)
    if postNumber == 1
      $('#prev').css('visibility','hidden')
      $('#1').addClass('active')
    if postNumber > 2
      link_num = postNumber - 2
      $('#3').addClass('active')
    else
      link_num = 1
      $('#' + postNumber).addClass('active')
    for link in links
      link.textContent = link_num + _i
    $('#next').attr('href', (postNumber + 1))





    
    
