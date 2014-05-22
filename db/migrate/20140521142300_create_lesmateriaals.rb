class CreateLesmateriaals < ActiveRecord::Migration
  def change
    create_table :lesmateriaals do |t|
      t.text :title
      t.text :info
      t.string :image
      t.string :video

      t.timestamps
    end
  end
end
