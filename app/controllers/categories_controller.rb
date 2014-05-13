class CategoriesController < ApplicationController
  respond_to :html, :json
  def show
    unless @category = Category.find_by_submenuname(params[:submenuname])
      redirect_to root_path
    end
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