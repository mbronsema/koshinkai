class PostsController < ApplicationController

 respond_to :html, :json
  def index
    @posts = Post.all
    respond_with @posts
  end

  def home
      @event = Event.last(3)
      @eventchanged = Event.all
      @category = Category.find_by_submenuname('Nieuws')
      @post = Post.where(:category_id => @category.id).last
    end

  def show
    @post = Post.find(params[:id])
    respond_with @post
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
    params.require(:post).permit(:title, :content, :prive, :approved, :user_id, :category_id, :event_id)
  end

end
