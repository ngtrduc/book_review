class Admin::BooksController < Admin::BaseController
  load_and_authorize_resource
  before_action :load_category, only: [:new, :edit, :update]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = "Create Successfully!!!"
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
      flash[:success] = "Update successfully"
      redirect_to admin_book_path @book
    else
      flash[:error] = "An error occured, please try again."
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = "Destroy book Successfully"
    else
      flash[:error] = "An error occured, please try again."
    end
    redirect_to admin_books_path
  end

  private
  def book_params
    params.require(:book).permit :title, :description, :publish_date, :author,
      :number_page, :category_id, :picture, :rate_avg
  end

  def load_category
    @categories = Category.all
  end
end
