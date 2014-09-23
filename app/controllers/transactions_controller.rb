class TransactionsController < ApplicationController
	before_action :all_transactions, only: [:index, :create]
	before_action :all_columns, only: [:index, :create]
	before_action :calculate_total, only: [:index]

	respond_to :html, :js

	def new
		@transaction = Transaction.new
	end

	def create
		@transaction = Transaction.new(transaction_params)
		
		@transaction.save
		calculate_total
	end

	def destroy
		@transaction = Transaction.find(params[:id])
		@transaction.destroy
		calculate_total
	end

	private
	    def all_transactions
	    	@transactions = Transaction.all
	    end

	    def all_columns
	      	rejects = ["id", "created_at", "updated_at"]
			@columns = Transaction.column_names.reject do |column| 
				rejects.include?(column)
			end
	    end

	    def transaction_params
	    	params.require(:transaction).permit(:name, :amount, :kind)
	    end

	    def calculate_total
	    	@total = 0
	    	all_transactions
			@transactions.each do |t|
				@total += t.amount if t.kind == 'debit'
				@total -= t.amount if t.kind == 'credit'
			end
		end    

end
