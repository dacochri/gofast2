class Trailer < ActiveRecord::Base
  attr_accessible :last_safety_id, :last_service_id, :license_plate, :make, :manufactured_year, :model, :next_safety_date, :next_service_date, :trailer_no, :trailer_type, :vin_number

  validates :last_safety_id, :last_service_id, :license_plate, :make, :manufactured_year, :model, :next_safety_date, :next_service_date, :trailer_no, :trailer_type, :vin_number
  validates :last_safety_id, :last_service_id, :manufactured_year, :trailer_no, :numericality => true
  validates :next_safety_date, :next_service_date, :format => date
  validates :model, :vim_number, :license_plate, :format => alpha_numeric
  validates :trailer_type, :format => alpha
end
