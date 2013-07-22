class Truck < ActiveRecord::Base
  attr_accessible :last_safety_id, :last_service_id, :license_expires, :license_plate, :make, :manufactured_year, :model, :next_safety_date, :next_service_kilometres, :owned, :total_kilometres, :truck_no, :truck_type, :vin_number

  validates :last_safety_id, :last_service_id, :license_expires, :license_plate, :make, :manufactured_year, :model, :next_safety_date, :next_service_kilometres, :owned, :total_kilometres, :truck_no, :truck_type, :vin_number
  validates :last_safety_id, :last_service_id, :manufactured_year, :truck_no, :numericality => true
  validates :license_expires, :next_safety_date, :format => date
  validates :next_service_kilometres, :total_kilometres, :format => double
  validates :make, :model, :vin_number, :format => alpha_numeric
end
