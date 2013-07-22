class Maintenance < ActiveRecord::Base
  attr_accessible :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id

  validates :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id, :presence => true
  validates :trip_id, :vehicle_id, :numericality => true
  validates :cost, :kilometres, :format => double
  validates :date, :format => date
  validates :maintenance_type, :format => maintenance_type
end
