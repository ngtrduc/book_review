module NotificationHelper
  def notification_content notification
    key = notification.key
    owner = notification.owner
    case key
    when "accept"
      content = "Admin accept your request"
    when "reject"
      content = "Admin reject your request"
    when "comment"
      content = "#{owner.name} comment on your reviews"
    when "vote"
      content = "#{owner.name} vote your reviews"
    when "follow"
      content = "#{owner.name} follow you"
    end
  end

  def notification_image notification
    owner = notification.owner
    image_tag owner.avatar, size: Settings.image_size_40, class: "img-circle"
  end

  def not_seen_notification
    if (size = current_user.notifications.not_seen.size) > 0
      size
    end
  end

  def notification_link notification
    key = notification.key
    if key == "follow"
      notification.owner
    else
      notification.target
    end
  end
end
