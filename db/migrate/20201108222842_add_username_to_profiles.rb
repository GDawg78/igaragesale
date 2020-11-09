class AddUsernameToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :username, :string
  end
end
