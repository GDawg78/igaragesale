class AddStateToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_reference :profiles, :state, null: false, foreign_key: true
  end
end
