class NotificationsController < ApplicationController
  def index
  end

  def update
    notifications = current_user.notifications.not_seen
    notifications.update_all seen: true
    respond_to do |format|
      format.js
    end
  end
end
