class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :event

  def self.search(query)
    where("title like ?" || "content like ?", "%#{query}%")
  end
end
