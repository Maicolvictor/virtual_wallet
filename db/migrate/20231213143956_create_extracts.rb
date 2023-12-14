class CreateExtracts < ActiveRecord::Migration[5.2]
  def change
    create_table :extracts do |t|
      t.string :transaction_type
      t.float :amount
      t.references :account, foreign_key: true
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end
