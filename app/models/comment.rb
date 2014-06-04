class Comment < ActiveRecord::Base
  belongs_to :reactable, :polymorphic => true
  belongs_to :user
end
