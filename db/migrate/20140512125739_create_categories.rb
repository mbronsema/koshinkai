class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :menuname
      t.string :submenuname

      t.timestamps
    end
  end
end
