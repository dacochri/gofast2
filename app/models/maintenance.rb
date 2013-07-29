class Maintenance < ActiveRecord::Base
  attr_accessible :vehicle_type, :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id

  validates :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id, :vehicle_type, :presence => true
  validates :trip_id, :vehicle_id, :numericality => true
  validates :cost, :kilometres, :format => double
  validates :date, :format => date
  validates :maintenance_type, :format => maintenance_type
end
