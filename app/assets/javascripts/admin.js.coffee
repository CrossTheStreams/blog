# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http:#jashkenas.github.com/coffee-script/
#= require bootstrap-modal

$(document).ready ->
  #Fetching posts for editting in modal.
  fetch_for_edit = (id) ->    
    $.ajax({
      url: '/api/posts/' + id + '/edit',
      dataType: 'json',
      success: (data) ->
        $('#edit-modal #title').val(data.title);
        $('#edit-modal #content').val(data.content);
        $('#edit-modal #keywords').val(data.keywords.map (d) -> " " + d);
        $('#edit-modal form')[0].action = location.host + "/api/posts/" + id
        $('#update-btn').data().id = id
        if data.published == true
          $('#edit-modal #published')[0].checked = true;
    });  
  $('#new-btn').on('click', -> 
    $('#new-modal').modal('show'))
  $('.edit-btn').on('click', ->
    element_id = @.id.toString()
    post_id = element_id.match(/[0-9]+/)[0]
    fetch_for_edit(post_id)
    $('#edit-modal').modal('show'))
  update_post = (id) ->
    content = $('#edit-modal textarea#content').val()
    title = $('#edit-modal input#title').val()
    published = $('#edit-modal #published').val()
    keywords = $('#edit-modal #keywords').val()
    $.ajax({
      url: '/api/posts/' + id + '/update'
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
        console.log();
        alert(data);
      failure: (data) ->
        alert(data)
    }); 
  $('#update-btn').on('click', ->
    id = $('#update-btn').data().id
    update_post(id)
  )
  # Deleting posts from table 
  delete_post = (id) ->
    $.ajax({
      url: '/api/posts/' + id 
      type: 'DELETE'
      success: (data) ->
        $('#post-id-' + data.id).fadeOut()
    });
  $('.delete-btn').on('click', ->
    $('#destroy-modal').attr('data-post',$(this).attr('data-post'))
    $('#destroy-modal').modal('show')
  )
  $('#destroy-post-btn').on('click', ->
    delete_post($('#destroy-modal').attr('data-post'))
    $('#destroy-modal').modal('hide')
  )

