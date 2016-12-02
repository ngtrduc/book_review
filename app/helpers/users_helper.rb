module UsersHelper
  def get_activity_trackable_content activity
    trackable_type = activity.trackable_type
    case trackable_type
    when "Review"
      "reviewed on"
    when "Comment"
      "commented in"
    when "Mark"
      "marked "
    when "Relationship"
      "followed"
    end
  end

  def get_activity_trackable_link activity
    trackable = activity.trackable
    recipient = activity.recipient
    trackable_type = activity.trackable_type
    case trackable_type
    when "Review"
      link_to recipient.title, trackable
    when "Comment"
      link_to "review", recipient
    when "Mark"
      link_to recipient.title, recipient
    when "Relationship"
      link_to recipient.name, recipient
    end
  end
end
