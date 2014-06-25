class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :show]
 respond_to :html, :json
  def index
   redirect_to root_path
  end

  def home
      @events = Event.where(repeat: 'Eenmalig').last(2)

      @eventchanged = Event.all

      #Niews
      @category = Category.where(url: 'nieuws').last
      if @category
      @post = Post.where(:category_id => @category.id).last
      end
     
      #schedule
      @scheduleevents = Event.where(repeat: 'Weekelijks')
  end

  def show
    @post = Post.find(params[:id])
    if @post.prive == true
      @post 
      respond_with @post
    else 
     @post = Post.find(params[:id])
     # @comment = Comment.new
     # @comments = Comment.all
     respond_with @post
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
