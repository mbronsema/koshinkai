class AdminpanelPolicy 
  
  attr_reader :user, :event, :post, :categorie
  
  def initialize(user, event, post, categorie)
    @user = user
    @event = event
    @post = post
    @categorie = categorie
  end

  
  def index?
     @user.admin?
  end
end