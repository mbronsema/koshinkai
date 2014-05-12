class CategoriesController < ApplicationController
  respond_to :html, :json
  def index
    @categories = Category.all
    respond_with @categorys
  end

  def show
    @category = Category.find(params[:id])
    respond_with @category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:menuname, :submenuname)
  end
end