class SetDefaultSourceToTransactions < ActiveRecord::Migration
  def change
  	change_column_default :transactions, :source, "UniCredit Bank Account"
  end
end
