class FavoritesController < ApplicationController
  include BooksHelper
  load_and_authorize_resource

  def index
    book = Book.find params[:book_id]
    @favorites = book.favorites.includes :user
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def create
    @book = Book.find_by id: params[:book_id]
    @book.favorites.create user: current_user
    respond_to do |format|
      format.html{redirect_to @book}
      format.json do
        render json: {
          content: render_to_string({
            partial: "books/mark_button",
            formats: "html",
            layout: false
            })
        }
      end
    end
  end

  def destroy
    @book = @favorite.book
    @favorite.destroy
    respond_to do |format|
      format.html{redirect_to @book}
      format.json do
        render json: {
          content: render_to_string({
            partial: "books/mark_button",
            formats: "html",
            layout: false
            })
        }
      end
    end
  end
end
