class Company < ActiveRecord::Base
	include Searchable
  attr_accessible :city, :company_type, :contact_name, :email, :fax, :name, :postal_code, :primary_phone, :province, :secondary_phone, :street, :unit
end
