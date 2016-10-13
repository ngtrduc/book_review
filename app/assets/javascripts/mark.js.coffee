$(document).on 'ready page:change', ->
  $('.reading_form').unbind 'submit'
  $('.reading_form').bind 'submit', (event) ->
    book_id = undefined
    method = undefined
    status = undefined
    url = undefined
    event.preventDefault()
    url = $(this).find('form').attr('action')
    book_id = $(this).find('input[name=\'book_id\']').val()
    status = $(this).find('input[name=\'status\']').val()
    method = $(this).find('form').find('input[name=_method]').val()
    if method == undefined
      method = 'post'
    $.ajax
      url: url
      method: method
      cache: false
      data:
        book_id: book_id
        status: status
      dataType: 'json'
      success: (result) ->
        if result.reading.status == null
          $('.reading_form div').removeClass 'btn-marked-reading'
          $('.reading_form div').find('form').attr 'action', '/marks/'
          $('.reading_form div').find('form').find('input[name=_method]').val 'post'
        else
          $('.reading_form div').addClass 'btn-marked-reading'
          $('.reading_form div').find('form').attr 'action', '/marks/' + result.reading.id
          $('.reading_form div').find('form').find('input[name=_method]').remove()
          $('.reading_form div').find('form').append '<input type="hidden" name="_method" value="delete">'
          $('.read_form div').removeClass 'btn-marked-read'
          $('.read_form div').find('form').attr 'action', '/marks/'
          $('.read_form div').find('form').find('input[name=_method]').val 'post'
        return
      error: (e) ->
    return
  $('.read_form').unbind 'submit'
  $('.read_form').bind 'submit', (event) ->
    book_id = undefined
    method = undefined
    status = undefined
    url = undefined
    event.preventDefault()
    url = $(this).find('form').attr('action')
    book_id = $(this).find('input[name=\'book_id\']').val()
    status = $(this).find('input[name=\'status\']').val()
    method = $(this).find('form').find('input[name=_method]').val()
    if method == undefined
      method = 'post'
    $.ajax
      url: url
      method: method
      cache: false
      data:
        book_id: book_id
        status: status
      dataType: 'json'
      success: (result) ->
        if result.read.status == null
          $('.read_form div').removeClass 'btn-marked-read'
          $('.read_form div').find('form').attr 'action', '/marks/'
          $('.read_form div').find('form').find('input[name=_method]').val 'post'
        else
          $('.read_form div').addClass 'btn-marked-read'
          $('.read_form div').find('form').attr 'action', '/marks/' + result.read.id
          $('.read_form div').find('form').find('input[name=_method]').remove()
          $('.read_form div').find('form').append '<input type="hidden" name="_method" value="delete">'
          $('.reading_form div').removeClass 'btn-marked-reading'
          $('.reading_form div').find('form').attr 'action', '/marks/'
          $('.reading_form div').find('form').find('input[name=_method]').val 'post'
        return
      error: (e) ->
    return
  return
