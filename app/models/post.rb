class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :event
end
