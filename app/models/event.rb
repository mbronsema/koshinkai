class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :posts
  has_many :comments, as: :reactable
end
