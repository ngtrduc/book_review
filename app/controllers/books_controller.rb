class BooksController < ApplicationController
  load_and_authorize_resource except: :show
  before_action :load_categories, only: [:index]

  def index
    @q = Book.search params[:q]
    @books = @q.result.page(params[:page]).per Settings.per_page
  end

  def show
    @book = Book.find_by id: params[:id]
    if @book.nil?
      flash[:danger] = t "books.show.error"
      redirect_to books_path
    else
      @reviews = @book.reviews.order(vote_count: :desc).page(params[:page])
          .per Settings.reviews.page
      if current_user
        @new_review = current_user.reviews.build
      end
    end
  end

  private
  def load_categories
    @categories = Category.all
  end
end
