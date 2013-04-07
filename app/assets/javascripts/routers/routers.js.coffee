class Blog.Routers.Posts extends Backbone.Router
  api_url = Blog.Collections.Posts.prototype.url
  routes:
    '': 'index'
    'posts/:id': 'show'
    'page/:pageNumber': 'page'
    'search/:query' : 'search'
    'tag/:keyword' : 'tag'

  initialize: ->
    @collection = new Blog.Collections.Posts()

  index: ->
    @collection.fetch()
    view = new Blog.Views.PostsIndex(collection: @collection)
    $('#feed').html(view.render().el)
    $('#prev').css('visibility','hidden')
    $('#next').attr('href','page/2')
    $('.prev').addClass('active')

  page: (pageNumber) ->
    collection = new Blog.Collections.Posts
    collection.fetch({data: {page: pageNumber}})
    view = new Blog.Views.PostsIndex(collection: collection)
    $('#feed').html(view.render().el)
    $('#prev').attr('href', '/page/' + (pageNumber - 1))
    links = $('.a')
    pageNumber = parseInt(pageNumber)
    if pageNumber <= 1 
       pageNumber = 1
       @navigate("") 
       $(".a")[0].style.borderLeftWidth = "1px"
       links.each (i, a) -> 
         a.href = '/page/' + (pageNumber)
    if pageNumber > 2
      link_num = pageNumber - 2
      $('#3').addClass('active')
      links.each (i, a) -> 
        a.href = '/page/' + (link_num + i)
    else 
      link_num = 1
      $('#' + pageNumber).addClass('active')
      links.each (i, a) -> 
        a.href = '/page/' + (link_num + i)
    $('#pre').attr('href', (pageNumber - 1))      
    $('#next').attr('href', (pageNumber + 1))

        
  show: (id) ->
    post = new Blog.Models.Post id: id
    view = new Blog.Views.PostsShow model: post
    collection = new Blog.Collections.Posts [post]
    post.fetch() 
    links = $('.a')
    postNumber = parseInt(id)
    $('#prev').attr('href', '/posts/' + (postNumber - 1))
    if postNumber == 1
      $(".a")[0].style.borderLeftWidth = "1px"
      $('#prev').css('visibility','hidden')
      $('#1').addClass('active')
      links.each (i, a) -> 
         a.href = '/posts/' + (postNumber)
    if postNumber > 2
      link_num = postNumber - 2
      $('#3').addClass('active')
      links.each (i, a) -> 
        a.href = '/posts/' + (postNumber - i)
    else
      link_num = 1
      $('#' + postNumber).addClass('active')
      links.each (i, a) -> 
        a.href = '/posts/' + (postNumber - i)
    $('#next').attr('href', (postNumber + 1))

  search: (query) ->
    collection = new Blog.Collections.Posts
    collection.fetch({url: api_url + '/search/' + query})
    view = new Blog.Views.PostsIndex(collection: collection)
    $('#feed').html(view.render().el)

  tag: (keyword) ->
    collection = new Blog.Collections.Posts
    collection.fetch({url: api_url + '/tag/' + keyword})
    view = new Blog.Views.PostsIndex(collection: collection)
    $('#feed').html(view.render().el)



