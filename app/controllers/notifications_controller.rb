class NotificationsController < ApplicationController
  def index
    @user = current_user
    @user_notifications = current_user.notifications.
      order(created_at: :desc).page(params[:page]).per Settings.per_page
  end

  def update
    notifications = current_user.notifications.not_seen
    notifications.update_all seen: true
    respond_to do |format|
      format.js
    end
  end
end
