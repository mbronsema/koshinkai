class CategoriesController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!, except: [:show]
  def show
    # unless @category = Category.find_by_url(params[:url])
    #   redirect_to root_path
    @category = Category.find_by_url(params[:url])
    if @category.parent_id != nil
    @headcategory = Category.where(:id => @category.parent_id).last

   end
    @posts = Post.where(category_id: @category.id).all
  
    # end
  end

  def new
    @category = Category.new
    @categories = Category.where(parent_id: nil).all
    authorize @users
  end


  

  def create
    @category = Category.new(category_params)
    @category.menuname.downcase!
    authorize @users
    if @category.save
      redirect_to adminpanels_path
    else
      render 'new'
    end
  end

  def edit 
    @category = Category.find(params[:id])
  end



  def postnew 
    #@category = Category.find_by_url(params[:url])
    @po = Post.new
  end

  def postcreate
   # @category = Category.find_by_url(params[:url])
    @post = Post.new(post_params)
    #@post.category_id = @category.id
    @post.user_id = current_user.id
    @post.prive = true
    if @post.save
      redirect_to @post
    else
      render 'postnew'
    end
  end

  def edit 
    @category = Category.find(params[:id])
  end
  

  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to adminpanels_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to adminpanels_path
  end

  private
  def category_params
    params.require(:category).permit(:menuname, :parent_id, :prive, :url)
  end

   def post_params
    params.require(:post).permit(:title, :content, :prive, :approved, :user_id, :category_id)
  end
end