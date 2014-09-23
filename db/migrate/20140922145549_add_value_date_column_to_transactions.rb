class AddValueDateColumnToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :valuedate, :date
  end
end
