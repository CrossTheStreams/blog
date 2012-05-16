#= require ../../../templates/posts/index.jst.eco

class Blog.Views.PostsIndex extends Backbone.View

  template: JST['posts/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template(posts: @collection))
    this

