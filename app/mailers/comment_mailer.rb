class CommentMailer < ActionMailer::Base
  def send_email_comment comment
    @comment = comment
    mail to: comment.review.user.email, subject: t("comments.a_new_comment")
  end
end
