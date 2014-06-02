class MyDevise::RegistrationsController < Devise::RegistrationsController

def create
  super #calling devise::registrationcontroller#create when user is created, create a new verifier
  #and populate the verifier.user_id the same user_id that's just been created
  if resource.save
    UserMailer.welcome_email(@user).deliver
  end
end
end

