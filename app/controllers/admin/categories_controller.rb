class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @category = Category.new
    @Categorys = Category.all
  end

  def show
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_Categories_path
    else
      @categories = Category.all
      render :index
    end
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_Categories_path
    else
      render :edit
    end
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
end
