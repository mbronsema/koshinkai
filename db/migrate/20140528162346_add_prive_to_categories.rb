class AddPriveToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :prive, :boolean
  end
end
