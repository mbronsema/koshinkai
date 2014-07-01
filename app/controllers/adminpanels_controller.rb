class AdminpanelsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @events = Event.all
    @users = User.all
    @posts = Post.all
    @categories = Category.all
  end
end

