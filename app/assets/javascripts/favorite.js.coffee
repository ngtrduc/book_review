$(document).on 'ready page:change', ->
  $('.new_favorite').unbind 'submit'
  $('.new_favorite').bind 'submit', (event) ->
    event.preventDefault()
    url = $(this).attr('action')
    book_id = $(this).find('#book_id').val()
    $.ajax
      url: url
      method: 'POST'
      data: {book_id: book_id}
      dataType: 'json'
      success: (result) ->
        $("#form-btn-mark").html(result.content)
  $('.edit_favorite').unbind 'submit'
  $('.edit_favorite').bind 'submit', (event) ->
    event.preventDefault()
    url = $(this).attr('action')
    book_id = $(this).find('#book_id').val()
    $.ajax
      url: url
      method: 'DELETE'
      data: {book_id: book_id}
      dataType: 'json'
      success: (result) ->
        $("#form-btn-mark").html(result.content)
