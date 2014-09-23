class Transaction < ActiveRecord::Base
	validates :name, presence: true
end
