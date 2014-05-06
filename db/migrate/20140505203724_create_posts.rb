class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :prive
      t.boolean :approved
      t.integer :user_id
      t.integer :category_id
      t.integer :event_id
      t.integer :attachment_id

      t.timestamps
    end
  end
end
