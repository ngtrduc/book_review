module BooksHelper
  def get_picture book
    image_url = book.picture.present? ? book.picture : Settings.books.url
    image_url = Settings.book_link if Rails.env.production?
    image_tag = "<img src=#{image_url} width=#{Settings.books.detail_width}
      class='book-detail-shadow' >"
    image_tag.html_safe
  end
end
