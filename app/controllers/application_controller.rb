class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  before_action :authenticate_user!
  before_filter :fetch_menu
  protect_from_forgery with: :exception
	
  before_action :set_locale
		def set_locale
			I18n.locale = params[:locale] || I18n.default_locale
		end


   def fetch_menu
    @menu = Category.all
    @mainmenu = {'Home' => root_path, 'Prijzen' => '#', 'Aikido' => '#','Koshinkai' => '#', 'Agenda' => events_path, 'Media' => '#', 'Contant' => '#'}
  end
  
  protected
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #
 # def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) << :name
  #  devise_parameter_sanitizer.for(:account_update) << :name
  #end
  
  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end
end