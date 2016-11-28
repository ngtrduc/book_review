class StaticPagesController < ApplicationController
  def home
    @books = Book.order("rate_avg DESC").includes(:favorites, :reviews).page params[:page]
    @mini_books = Book.random_book
    @reviews = Review.last_reviews.includes(:user, :book)
    @request = Request.new
  end

  def help
  end

  def about
  end

  def search
  end

  def getDataSearch
    @books_for_search = Book.all.as_json(only: [:title, :id, :picture])
    render json: @books_for_search
  end

  def getDataSearchwithAuthor
    @books_search_with_author = Book.all.as_json(only: [:author, :id])
    render json: @books_search_with_author
  end
end
