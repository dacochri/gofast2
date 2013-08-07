class Truck < ActiveRecord::Base
  attr_accessible :license_expires, :license_plate, :make, :manufactured_year, :model, :owner, :total_kilometres, :truck_no, :truck_type, :vin_number, :current_location
  
  def self.search(search)
  if search
    where('truck_no LIKE ?', "%#{search}%")
  else
    scoped
  end
end
end
