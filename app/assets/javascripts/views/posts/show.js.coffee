class Blog.Views.PostsShow extends Backbone.View
  el: '#feed'

  template: JST['posts/show']

  initialize: ->
    @model.bind('change', @render, this)

  render: ->
    $(@el).html(@template(post: @model))
    Rainbow.color()
    @

