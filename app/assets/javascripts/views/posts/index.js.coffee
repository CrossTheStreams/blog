class Blog.Views.PostsIndex extends Backbone.View

  template: JST['posts/index']

  render: ->
    $(@el).html(@template())
    this

