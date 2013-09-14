class Expense < ActiveRecord::Base
	include Searchable
  
  attr_accessible :driver_pay, :fuel, :misc_cost, :quick_pay

  message = ValidationValues.message

  validates :driver_pay, :fuel, :misc_cost, :quick_pay, :presence => true
  validates :driver_pay, :fuel, :misc_cost, :quick_pay, :format => { :with => ValidationValues.double, :essage => message }
end
