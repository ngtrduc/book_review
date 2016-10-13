class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page]).per Settings.per_page
 end
end
