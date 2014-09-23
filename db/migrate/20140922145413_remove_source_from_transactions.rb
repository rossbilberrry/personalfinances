class RemoveSourceFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :source, :string
  end
end
