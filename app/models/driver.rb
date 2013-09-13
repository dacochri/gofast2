class Driver < ActiveRecord::Base
	include Searchable
  
  attr_accessible :business_name, :cell_phone, :city, :comments, :first_name, :home_phone, :hst_no, :last_name, :postal_code, :street, :unit
end
