class AddSoldToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sold, :boolean
  end
end
