class StaticPagesController < ApplicationController
  def home
    @books = Book.order("rate_avg DESC").includes(:favorites, :reviews).page params[:page]
    @mini_books = Book.random_book
    @reviews = Review.random_reviews.includes(:user, :book)
    @request = Request.new
  end

  def help
  end

  def about
  end

  def search
  end
end
