class User < ActiveRecord::Base
  
  validates_each :invite_code, :on => :create do |record, attr, value|
      record.errors.add attr, "Please enter correct invite code" unless
        value && value == "hoi"
      end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  #attr_accessors :invite_code
 # attr_accessible :invite_code
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  mount_uploader :avatar, AvatarUploader
  
  enum role: [:user, :member, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :member
  end
                
  has_many :posts
  has_many :events
  has_many :comments
  
  
 
end
