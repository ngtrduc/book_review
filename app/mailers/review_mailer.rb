class ReviewMailer < ApplicationMailer
  def send_email_review new_review
    @new_review = new_review
    mail to: new_review.user.email, subject: t("reviews.create_new_review")
  end
end
