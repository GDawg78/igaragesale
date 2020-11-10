class AddStreetNameToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :street_name, :string
  end
end
