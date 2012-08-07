window.Blog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Blog.Routers.Posts
    Backbone.history.start({pushState: true})

$(document).ready ->
  Blog.init()
  input = $('#blog-search')
  input.focus()

$('#tag-cloud').click (e) ->
  e.preventDefault()
  $(@).tab('show')


