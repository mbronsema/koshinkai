class ContactController < ApplicationController
  before_filter :authenticate_user!, except: [:new, :create, :update, :delete, :send_mail]
 
  def send_mail
      name = params[:name]
      email = params[:email]
      body = params[:comments]
      ContactMailer.contact_email(name, email, body).deliver
      redirect_to new_contact_path, notice: 'Message sent'
  end
end