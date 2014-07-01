class AddAlterationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :alteration, :boolean
  end
end
