class EventPolicy < Struct.new(:user, :event)
    def update?
      user.admin?
    end
    def new?
      user.admin?
    end
  
    def create?
     user.vip?
    end
   
    def index?
      user.admin?
    end
    
    def update?
      user.admin? 
    end

    def destroy?
      user.admin?
    end
  end


