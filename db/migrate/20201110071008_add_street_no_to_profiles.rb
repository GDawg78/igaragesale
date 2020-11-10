class AddStreetNoToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :street_no, :integer
  end
end
