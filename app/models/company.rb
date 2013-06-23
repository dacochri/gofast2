class Company < ActiveRecord::Base
  attr_accessible :city, :contact_name, :email, :fax, :name, :postal_code, :primary_phone, :privince, :secondary_phone, :street, :type, :unit
end
