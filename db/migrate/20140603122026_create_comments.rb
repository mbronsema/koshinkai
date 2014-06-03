class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :message
      t.integer :user_id
      t.integer :reactable_id
      t.string :reactable_type

      t.timestamps
    end
  end
end
