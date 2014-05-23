class AdminpanelsController < ApplicationController
  def index
    @posts = Post.all
    @events = Event.all
    @users = User.all
  end
end
