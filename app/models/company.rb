class Company < ActiveRecord::Base
  attr_accessible :city, :company_type, :contact_name, :email, :fax, :name, :postal_code, :primary_phone, :province, :secondary_phone, :street, :unit

  validates :city, :company_type, :name, :postal_code, :primary_phone, :province, :street, :presence => true
  validates :fax, :primary_phone, :secondary_phone, :numericality => true
  validates :fax, :length => 10
  validates :name, :format => company
  validates :primary_phone, :secondary_phone, :length => 10..11
  validates :city, :format => city
  validates :contact_name, :format => last_name
  validates :street, :format => street
  validates :province, :inclusion => { :in => province }
  validates :postal_code, :format => postal_code
  validates :email, :format => email
  validates :unit, :format => unit
end
