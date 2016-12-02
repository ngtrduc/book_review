module ApplicationHelper
  def full_title page_title = ""
    base_title = t "app_name"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def disabled user_id, book_id
    review = Review.where "book_id = ? AND user_id = ?", book_id, user_id
    "disable-input" unless review.empty?
  end

  def request_status status
    if status == "waitting"
      "btn-primary"
    elsif status == "accepted"
      "btn-success"
    else
      "btn-danger"
    end
  end
end
