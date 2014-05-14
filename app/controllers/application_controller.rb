class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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
end