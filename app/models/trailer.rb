class Trailer < ActiveRecord::Base
  attr_accessible :last_safety_id, :last_service_id, :license_plate, :make, :manufactured_year, :model, :next_safety_date, :next_service_date, :trailer_no, :trailer_type, :vin_number
end
