class AddDateToExtracts < ActiveRecord::Migration[5.2]
  def change
    add_column :extracts, :date, :datetime
  end
end
