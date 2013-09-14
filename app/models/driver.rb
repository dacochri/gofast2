class Driver < ActiveRecord::Base
	include Searchable
  
  attr_accessible :business_name, :cell_phone, :city, :comments, :first_name, :home_phone, :hst_no, :last_name, :postal_code, :street, :unit

  message = ValidationValues.message
  
  validates :city, :first_name, :last_name, :home_phone, :postal_code, :street, :presence => true
  validates :business_name, :format => { :with => ValidationValues.company, :message => message }
  validates :cell_phone, :home_phone, :numericality => true
  validates :cell_phone, :home_phone, :length => 10..11
  validates :first_name, :format => { :with => ValidationValues.first_name, :message => message }
  validates :last_name, :format => { :with => ValidationValues.last_name, :message => message }
  validates :street, :format => { :with => ValidationValues.street, :message => message }
  validates :unit, :format => { :with => ValidationValues.unit, :message => message }
  validates :postal_code, :format => { :with => ValidationValues.postal_code, :message => message }
  validates :hst_no, :format => { :with => ValidationValues.hst_no, :message => message }
end
