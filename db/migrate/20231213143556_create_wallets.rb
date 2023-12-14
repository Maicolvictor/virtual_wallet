class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.float :balance
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
