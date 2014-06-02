class AdminpanelsController < ApplicationController
  def index
    @events = Event.all
    @users = User.all
    @posts = Post.all
  end
end

