class CategoriePolicy 
  attr_reader :user, :categorie
  
  def initialize(user, categorie)
    @user = user
    @categorie = categorie
  end

  def new?
    @user.admin?
  end

  def edit?
    @user.admin?
  end
       
  def index?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

end