class AdminpanelPolicy < Struct.new (:user, :event, :post) 
  
  def index?
     @user.member?
  end
end