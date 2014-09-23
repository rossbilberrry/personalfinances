class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
    	t.column( :name, :string)
    	t.column( :amount, :integer)
      	t.timestamps
    end
  end
end
