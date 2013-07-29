class Truck < ActiveRecord::Base
  attr_accessible :license_expires, :license_plate, :make, :manufactured_year, :model, :owner, :total_kilometres, :truck_no, :truck_type, :vin_number, :current_location

  validates :license_expires, :license_plate, :make, :manufactured_year, :model, :owner, :total_kilometres, :truck_no, :truck_type, :vin_number, :current_location
  validates :manufactured_year, :truck_no, :owner, :numericality => true
  validates :license_expires, :format => date
  validates :total_kilometres, :format => double
  validates :make, :model, :vin_number, :format => alpha_numeric
  validates :current_location, :format => street
end
