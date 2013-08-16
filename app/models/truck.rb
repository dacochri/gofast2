class Truck < ActiveRecord::Base
  attr_accessible :license_expires, :license_plate, :make, :manufactured_year, :model, :owner, :total_kilometres, :truck_no, :truck_type, :vin_number, :current_location
  
  message = ValidationValues.message

  validates :license_expires, :license_plate, :make, :manufactured_year, :model, :owner, :total_kilometres, :truck_no, :truck_type, :vin_number, :current_location, :presence => true
  validates :manufactured_year, :truck_no, :owner, :numericality => true
  validates :license_expires, :format => { :with => ValidationValues.date, :message => message }
  validates :total_kilometres, :format => { :with => ValidationValues.double, :message => message }
  validates :make, :model, :vin_number, :format => { :with => ValidationValues.alpha_numeric, :message => message }
  validates :current_location, :format => { :with => ValidationValues.street, :message => message }
  validates :license_plate, :format => { :with => ValidationValues.license_plate, :message => message }
  validates :license_plate, :length => 3..8
end
