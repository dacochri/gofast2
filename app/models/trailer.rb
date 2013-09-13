class Trailer < ActiveRecord::Base
	include Searchable
  
  attr_accessible :license_plate, :make, :manufactured_year, :model, :trailer_no, :trailer_type, :vin_number
end
