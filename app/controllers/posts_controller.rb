class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:home]
 respond_to :html, :json
  def index
   redirect_to root_path
  end

  def home
      @event = Event.last(3)
      @eventchanged = Event.all
      if @category = @category = Category.where.not(parent_id: nil).find_by_menuname(params[:name])
      @post = Post.where(:category_id => @category.id).last(2)
      else
      @post = Post.all
    end
  end

  def show
    if @post.prive
      @post = Post.find(params[:id])
      respond_with @post
    else 
     @post = Post.find(params[:id])
    end
  end

  def search
    if params[:search]
      @searchresults = Post.search(params[:search]).order("created_at DESC").all
      if @searchresults.length == 0
        @searchresults = Post.order('created_at DESC').all
      end
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit 
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :prive, :approved, :user_id, :category_id, :event_id, :attachment_id, :created_at, :updated_at)
  end

end
