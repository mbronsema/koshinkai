class MyDevise::RegistrationsController < Devise::RegistrationsController

  def invite_code 
    super
    invite_code = @invite_code
  end 


def create
  super #calling devise::registrationcontroller#create when user is created, create a new verifier
  #and populate the verifier.user_id the same user_id that's just been created
  if resource.save
    UserMailer.welcome_email(@user).deliver
  end
end
end
