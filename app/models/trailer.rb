class Trailer < ActiveRecord::Base
  attr_accessible :license_plate, :make, :manufactured_year, :model, :trailer_no, :trailer_type, :vin_number

  validates :license_plate, :make, :manufactured_year, :model, :trailer_no, :trailer_type, :vin_number
  validates :manufactured_year, :trailer_no, :numericality => true
  validates :model, :vim_number, :license_plate, :format => alpha_numeric
  validates :trailer_type, :format => alpha
end
