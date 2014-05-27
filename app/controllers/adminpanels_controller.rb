class AdminpanelsController < ApplicationController
  def index
    @events = Event.all
    @users = User.all
     @posts = Post.all
  end


  def showusers
    @user = User.find(params[:id])
  end

  def showposts
    @post = Post.find(params[:id])
  end

  def editposts
  end
  
  def destroypost
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end 
 
  
  def showevents
    @event = Event.find(params[:id])
  end

  def showattachments
    @attachments = Attachments.find(params[:id])
  end

  def showcomments
    @comment = Comment.find(params[:id])
  end
end

