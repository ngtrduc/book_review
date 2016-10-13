class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page]).per Settings.per_page
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "admin.categories.success"
      redirect_to admin_root_url
    else
      flash[:danger] = t "admin.categories.fail"
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
