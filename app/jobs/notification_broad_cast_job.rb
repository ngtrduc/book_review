class NotificationBroadCastJob < ApplicationJob
  queue_as :default

  def perform object, key, owner_id
    if object.class.name == "User"
      notification = Notification.create target_id: object.id, target_type: object.class.name,
        key: key, owner_id: owner_id, owner_type: "User", user_id: object.id
      notify_content = "You have a notifications"
      BroadCastService.new(notification, "notification_channel_#{object.id}", notify_content).broadcast
    else
      notification = Notification.create target_id: object.id, target_type: object.class.name,
        key: key, owner_id: owner_id, owner_type: "User", user_id: object.user.id
      notify_content = "You have a notifications"
      BroadCastService.new(notification, "notification_channel_#{object.user.id}", notify_content).broadcast
    end


  end
end
