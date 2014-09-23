class AddKindToTransations < ActiveRecord::Migration
  def change
  	add_column :transactions, :kind, :string
  end
end
