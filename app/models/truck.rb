class Truck < ActiveRecord::Base
  attr_accessible :last_safety_id, :last_service_id, :license_expires, :license_plate, :make, :manufactured_year, :model, :next_safety_date, :next_service_kilometres, :owned, :total_kilometres, :truck_no, :truck_type, :vin_number
end
