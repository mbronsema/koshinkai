class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show]

  def index
    @users = User.all
    authorize @users
  end

  def new
   @user = User.new(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end
  
  def edit
    @user = User.find(params[:id])
     authorize @user
  end
  

  def invite_code 
    @invite_code 
  end 

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to adminpanels_path, :notice => "User updated."
    else
      redirect_to adminpanels_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    unless user == current_user
      user.destroy
      redirect_to  adminpanels_path, :notice => "User deleted."
    else
      redirect_to adminpanels_path, :notice => "Can't delete yourself."
    end
  end
  def secure_params
    params.require(:user).permit(:email, :role, :invite_code)
  end
end