class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :flat_no
      t.integer :street_no
      t.string :street_name
      t.integer :post_code

      t.timestamps
    end
  end
end
