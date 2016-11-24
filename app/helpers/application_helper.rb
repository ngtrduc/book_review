module ApplicationHelper
  def full_title page_title = ""
    base_title = t "app_name"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def disabled user_id, book_id
    reviews = Review.where(book_id: book_id).includes(:user)
    check = 0
    reviews.each do |review|
      if review.user.id == user_id
        check = 1
        break
      end
    end
    "disable-input" if check == 1
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
