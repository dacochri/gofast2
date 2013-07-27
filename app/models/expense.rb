class Expense < ActiveRecord::Base
  attr_accessible :driver_pay, :fuel, :misc_cost, :quick_pay
end
