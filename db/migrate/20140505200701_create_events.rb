class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :message
      t.datetime :starting_at
      t.datetime :ending_at
      t.string :repeat
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
