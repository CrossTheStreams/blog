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
  $('#update-btn').on('click', -> 
        $.ajax({
          url: '/api/posts/' + id + '/edit',
          dataType: 'json',
          success: (data) ->
        }); 
  )
  # Deleting posts from table 
  delete_post = (id) ->
    $.ajax({
      url: '/api/posts/' + id 
      type: 'DELETE'
      success: (data) ->
        console.log(data)
        console.log(data.id)
        console.log(typeof data.id)
        $('#post-id-' + data.id).fadeOut()
    });
  $('.delete-btn').on('click', -> 
    element_id = @.id
    post_id = element_id.match(/[0-9]+/)[0]
    delete_post(post_id)
  )

