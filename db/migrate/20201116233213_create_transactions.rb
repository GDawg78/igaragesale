class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :seller, null: false, foreign_key: { to_table: 'users' }
      t.references :buyer, null: false, foreign_key: { to_table: 'users' }
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
