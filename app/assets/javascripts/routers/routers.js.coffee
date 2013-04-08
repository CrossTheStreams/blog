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

  page: (pageNumber) ->
    collection = new Blog.Collections.Posts
    console.log(collection)
    collection.fetch({data: {page: pageNumber}})
    view = new Blog.Views.PostsIndex(collection: collection)
    page_int = parseInt(pageNumber)
    page_count = parseInt($("#page-count").val())
    $('#feed').html(view.render().el)
    if page_int - 1 != 0
      $('#prev').attr('href', '/page/' + (page_int - 1))
    else
      $('.prev').css('visibility', 'hidden')
    unless page_int + 1 > page_count
      $('#next').attr('href', '/page/' + (page_int + 1))
    else
      $('.next').css('visibility', 'hidden')

        
  show: (id) ->
    post = new Blog.Models.Post id: id
    view = new Blog.Views.PostsShow model: post
    collection = new Blog.Collections.Posts [post]
    post.fetch {
      success: (post) -> 
        window.foo = post
        postNumber = parseInt(id)
        next = post.attributes.next
        prev = post.attributes.previous
        console.log(next)
        if next != ""
          $("#next").attr('href', '/posts/' + next)
        else
          $('.next').css('visibility', 'hidden')
        if prev != ""
          $("#prev").attr('href', '/posts/' + prev)
        else
          $('.prev').css('visibility', 'hidden')
      }


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



