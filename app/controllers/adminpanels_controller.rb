class AdminpanelsController < ApplicationController
  before_filter :authenticate_user!

  after_action :verify_authorized, except: [:show]
  
  def index  
    @events = Event.all
    @users = User.all
    @posts = Post.all
    @categories = Category.all
    authorize @users

end
end

