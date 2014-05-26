class AdminpanelsController < ApplicationController
  def index
    @posts = Post.all
    @events = Event.all
    @users = User.all
  end


  def showusers
    @user = User.find(params[:id])
  end

  def showposts
    @post = Post.find(params[:id])
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
