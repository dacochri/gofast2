class Trailer < ActiveRecord::Base
  attr_accessible :license_plate, :make, :manufactured_year, :model, :trailer_no, :trailer_type, :vin_number
  
  message = ValidationValues.message

  validates :license_plate, :make, :manufactured_year, :model, :trailer_no, :trailer_type, :vin_number
  validates :manufactured_year, :trailer_no, :numericality => true
  validates :model, :vin_number, :format => { :with => alpha_numeric, :message => message }
  validates :trailer_type, :inclusion => { :in => ValidationValues.vehicle_sub_type }
  validates :license_plate, :length => 3..8
  validates :license_plate, :format => { :with => ValidationValues.license_plate, :message => message }
end
