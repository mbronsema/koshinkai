class Changefieldscategories < ActiveRecord::Migration
  def change
      rename_column :categories, :submenuname, :parent_id
      change_column :categories, :parent_id, :integer
  end
end
