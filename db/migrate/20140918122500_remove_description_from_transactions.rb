class RemoveDescriptionFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :description, :string
  end
end
