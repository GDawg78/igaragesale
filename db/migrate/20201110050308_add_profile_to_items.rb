class AddProfileToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :profile, null: false, foreign_key: true
  end
end
