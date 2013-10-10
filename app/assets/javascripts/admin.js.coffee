# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http:#jashkenas.github.com/coffee-script/
#= require bootstrap-modal
$(document).ready ->
  #Fetching posts for editting in modal. 
  fetch_for_edit = (id) ->
    $.ajax
      url: '/api/posts/' + id + '/edit'
      dataType: 'json'
      success: (data) ->
        $('.keyword').remove()
        console.log(data)
        $('#edit-modal #title').val(data.title)
        $('#edit-modal #content').val(data.content)
        for keyword in data.keywords
          keyword_div = $(jQuery.parseHTML('<div class="keyword" data-id="'+keyword.id+'"><span class="name">'+keyword.name+'</span><a class="close-keyword">  X</a></div>'))
          $('#edit-modal .tags').append(keyword_div)
        if data.published == true
          $('#edit-modal #published')[0].checked = true
        $('#edit-modal form')[0].action = location.host + "/api/posts/" + id
        $('#update-btn').data().id = id
      complete: (data) ->
        $('.close-keyword').on('click', ->
          $(this).parents('.keyword').remove())
  $('input#keywords').on('keydown', -> 
    if event.which == 13
      name = $(this).val().trim()
      input = $(this)
      $.ajax
        url: '/admin/keyword'
        data: {name: name}
        success: (data) ->
          $(this).val('')
          keyword_div = $(jQuery.parseHTML('<div class="keyword" data-id="'+data['id']+'"><span class="name">'+name+'</span><a class="close-keyword">  X</a></div>'))
          input.siblings(".tags").append(keyword_div).find('.close-keyword').on('click', -> 
            $(this).parents('.keyword').remove())
  )
  $('#new-btn').on('click', ->
    $('#new-modal').modal('show'))
  $('.edit-btn').on('click', ->
    element_id = @.id.toString()
    post_id = element_id.match(/[0-9]+/)[0]
    fetch_for_edit(post_id)
    $('#edit-modal').modal('show'))
  send_post = (id, action) ->
    modal = ""
    if action == "update"
      modal = "#edit-modal"
    else if action == "create"
      modal = "#new-modal"
      id = ""
    content = $(modal+' textarea#content').val()
    title = $(modal+' input#title').val()
    published = $(modal+' #published').is(':checked') ? 1 : 0
    keywords = ($(div).attr('data-id') for div in $(modal+' .keyword'))
    console.log(keywords)
    $.ajax
      url: '/api/posts/' + action + "/" + id
      dataType: 'text'
      type: 'POST'
      data: {  'post' : {
            'id' : id,
            'title' : title,
            'content' : content,
            'published' : published,
            'keywords' : keywords 
            }
        }
      success: (data) ->
        alert(data);
      failure: (data) ->
        alert(data)
  $('#create-btn').on('click', ->
    send_post(undefined, "create")
  )
  $('#update-btn').on('click', ->
    id = $('#update-btn').data().id
    send_post(id, "update")
  )
  # Deleting posts from table 
  delete_post = (id) ->
    $.ajax
      url: '/api/posts/' + id 
      type: 'DELETE'
      success: (data) ->
        $('#post-id-' + data.id).fadeOut()
  $('.delete-btn').on('click', ->
    $('#destroy-modal').attr('data-post',$(this).attr('data-post'))
    $('#destroy-modal').modal('show')
  )
  $('#destroy-post-btn').on('click', ->
    delete_post($('#destroy-modal').attr('data-post'))
    $('#destroy-modal').modal('hide')
  )

