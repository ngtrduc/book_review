class Admin::BooksController < ApplicationController
  load_and_authorize_resource
  before_action :load_category, only: [:new, :edit, :update]

  def index
    @books = Book.page(params[:page]).per Settings.admin.books.page
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t "application.flash.books.create_success"
      redirect_to admin_books_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "application.flash.books.updated_success"
      redirect_to admin_book_path @book
    else
      flash[:error] = t "application.flash.books.updated_error"
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = t "application.flash.books.destroy_success"
    else
      flash[:error] = t "application.flash.books.destroy_fail"
    end
    redirect_to admin_books_path
  end

  private
  def book_params
    params.require(:book).permit :title, :description, :publish_date, :author,
      :number_page, :category_id, :picture
  end

  def load_category
    @categories = Category.all
  end
end
