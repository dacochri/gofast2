class Trailer < ActiveRecord::Base
  attr_accessible :license_plate, :make, :manufactured_year, :model, :trailer_no, :trailer_type, :vin_number

  validates :license_plate, :make, :manufactured_year, :model, :trailer_no, :trailer_type, :vin_number
  validates :manufactured_year, :trailer_no, :numericality => true
  validates :model, :vin_number, :format => alpha_numeric
  validates :trailer_type, :inclusion => { :in => vehicle_sub_type }
  validates :license_plate, :length => 3..8
  validates :license_plate, :format => license_plate
end
