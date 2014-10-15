class TransactionsController < ApplicationController
	before_action :authenticate_user!
	before_action :all_transactions, only: [:index, :create]
	before_action :all_columns, only: [:index, :create]
	before_action :calculate_total, only: [:index]

	respond_to :html, :js

	def new
		@transaction = Transaction.new
	end

	def create
		@transaction = Transaction.new(transaction_params)
		@transaction.user = current_user

		if @transaction.save
			calculate_total
		else
			error_message = ''
			@transaction.errors.each do |err, msg|
				error_message << err.to_s.capitalize + ' - ' + msg + '. '
			end
			flash[:notice] = error_message
			render js: "window.location = '/transactions'"
		end
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
	      	rejects = ["id", "created_at", "updated_at", "user_id"]
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
			@transactions.where(user: current_user).each do |t|
				@total += t.amount if t.kind == 'debit'
				@total -= t.amount if t.kind == 'credit'
			end
		end    

end
