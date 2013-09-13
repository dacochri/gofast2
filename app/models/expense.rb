class Expense < ActiveRecord::Base
	include Searchable
  
  attr_accessible :driver_pay, :fuel, :misc_cost, :quick_pay
end
