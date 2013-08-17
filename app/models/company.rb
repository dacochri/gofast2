class Company < ActiveRecord::Base
  attr_accessible :city, :company_type, :contact_name, :email, :fax, :name, :postal_code, :primary_phone, :province, :secondary_phone, :street, :unit

  message = ValidationValues.message
  
  validates :city, :company_type, :name, :postal_code, :primary_phone, :province, :street, :presence => true
  validates :fax, :primary_phone, :secondary_phone, :numericality => true
  validates :fax, :length => 10..11
  validates :name, :format => { :with => ValidationValues.company, :message => message }
  validates :primary_phone, :secondary_phone, :length => 10..11
  validates :city, :format => { :with => ValidationValues.city, :message => message }
  validates :contact_name, :format => { :with => ValidationValues.last_name, :message => message }
  validates :street, :format => { :with => ValidationValues.street, :message => message }
  validates :province, :inclusion => { :in => ValidationValues.province }
  validates :postal_code, :format => { :with => ValidationValues.postal_code, :message => message }
  validates :email, :format => { :with => ValidationValues.email, :nessage => message }
  validates :unit, :format => { :with => ValidationValues.unit, :message => message }
end
