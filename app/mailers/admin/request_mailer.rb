class Admin::RequestMailer < ApplicationMailer
  def accept_request request
    @request = request
    mail to: request.user.email, subject: t("admin.request_mailer.request_accepted")
  end
end
