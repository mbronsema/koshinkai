class AdminpanelPolicy < Struct.new (:user, :event, :post) 
  def index?
    user.admin?
  end 
end