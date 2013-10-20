class Trailer < ActiveRecord::Base
	include Searchable
  
  attr_accessible :license_plate, :make, :manufactured_year, :model, :trailer_no, :trailer_type, :vin, :location, :color
  
  message = ValidationValues.message

  validates :license_plate, :make, :manufactured_year, :model, :trailer_no, :trailer_type, :vin, :location, :color, :presence => true
  validates :manufactured_year, :trailer_no, :numericality => true
  validates :model, :color, :format => { :with => ValidationValues.alpha_numeric, :message => message }
  validates :vin, :format => { :with => ValidationValues.vin, :message => message }
  validates :trailer_type, :inclusion => { :in => ValidationValues.trailer_type }
  validates :location, :format => { :with => ValidationValues.street, :message => message }
  validates :license_plate, :length => 3..8, :format => { :with => ValidationValues.license_plate, :message => message }
end
