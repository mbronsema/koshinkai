class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end
  
  def edit?
    @user.admin?
  end
       
  def index?
    @user.admin?
  end
  
  def show?
    false
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

end



