class Blog.Views.PostsShow extends Backbone.View
  el: '#feed'

  template: JST['posts/show']

  initialize: ->
    @model.bind('change', @render, this)

  render: ->
    $(@el).html(@template(post: @model))
    $('pre code').each((i, e) -> hljs.highlightBlock(e))
    @

  events: {
    'click .bubble-link' : 'bubbles_show' 
  }

  bubbles_show: ->
    $('#bubble-modal').modal('toggle')


