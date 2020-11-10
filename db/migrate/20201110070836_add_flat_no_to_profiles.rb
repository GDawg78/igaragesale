class AddFlatNoToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :flat_no, :integer
  end
end
