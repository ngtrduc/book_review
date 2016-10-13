$(document).on 'ready page:change', ->
  $('#new_comment').off 'submit'
  $('#new_comment').on 'submit', (event) ->
    event.preventDefault()
    url = $(this).attr('action')
    review_id = $(this).find('#comment_review_id').val()
    content_review = $(this).find('textarea#comment_content').val()
    $('textarea#comment_content').val ''
    $.ajax
      url: url
      method: 'POST'
      cache: false
      data: comment:
        review_id: review_id
        content: content_review
      dataType: 'JSON'
      success: (result) ->
        if result.status == "created"
          html_comment = '<div class="comments">'
          html_comment += '<div class="comments">'
          html_comment += '<li id="comment-' + result.comment.id + ' %>">'
          html_comment += '<a href="/users/10"><img src="/assets/user_3.png" alt="User 3" width="50" height="50"></a>'
          html_comment += '<span class="user"><a href="/users/10">' + result.user.name + '</a></span>'
          html_comment += '<span class="content">' + result.comment.content + '</span>'
          html_comment += '</li>'
          html_comment += '</div>'
          $('.reviews_comments').append html_comment
        return
      error: (er) ->
        console.log 'can not comment'
    return
  return
