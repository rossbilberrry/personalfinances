	class AddNameTypeAmountDescriptionToTransactions < ActiveRecord::Migration
  def change
    change_table :transactions do |t|
    	t.column( :name, :string)
    	t.column( :type, :string)
    	t.column( :amount, :integer)
    	t.column( :description, :string)
    end
  end
end
