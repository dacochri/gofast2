class Driver < ActiveRecord::Base
	include Searchable
  
  attr_accessible :business_name, :cell_phone, :city, :comments, :name, :home_phone, :postal_code, :street, :unit, :drivers_license_number, :date_of_birth

  message = ValidationValues.message
  
  validates :city, :name, :home_phone, :postal_code, :street, :drivers_license_number, :date_of_birth, :presence => true
  validates :business_name, :numericality => true, :allow_blank => true
  validates :cell_phone, :home_phone, :numericality => true, :length => 10..11
  validates :name, :format => { :with => ValidationValues.name, :message => message }
  validates :street, :format => { :with => ValidationValues.street, :message => message }
  validates :unit, :format => { :with => ValidationValues.address_unit, :message => message }, :allow_blank => true
  validates :postal_code, :format => { :with => ValidationValues.postal_code, :message => message }
  validates :drivers_license_number, :format => { :with => ValidationValues.alpha_numeric, :message => message }, :uniqueness => true
  validates :date_of_birth, :format => { :with => ValidationValues.date, :message => message }
end
