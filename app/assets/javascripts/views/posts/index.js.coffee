#= require ../../../templates/posts/index.jst.eco

class Blog.Views.PostsIndex extends Backbone.View

  template: JST['posts/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template(posts: @collection))
    $('pre code').each((i, e) -> hljs.highlightBlock(e))
    this

  events: {
    'click .bubble-link' : 'bubbles_show' 
  }

  bubbles_show: ->
    console.log("doing things")
    $('#bubble-modal').modal('toggle')

