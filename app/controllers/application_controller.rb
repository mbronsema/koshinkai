
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  #before_action :authenticate_user!
  before_filter :fetch_menu
  before_filter :fetch_menu_private
  protect_from_forgery with: :exception
  
  before_action :update_sanitized_params, if: :devise_controller?

  before_action :set_locale
		def set_locale
			I18n.locale = params[:locale] || I18n.default_locale
		end

  def fetch_menu
    @menu = Category.all
    @menu2 = Category.all
  end

  def fetch_menu_private
    @menu = Category.all
  end
  
  protected
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #
 # def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) << :name
  #  devise_parameter_sanitizer.for(:account_update) << :name
  #end
  
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:password_confirmation ,:password ,:email, :role, :avatar, :avatar_cache, :remove_avatar, :invite_code, :firstname, :lastname)}
  end
  
  def update_sanitized_params
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:firstname, :lastname, :password, :current_password)}
  end
  
  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end
end







  

