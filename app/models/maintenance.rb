class Maintenance < ActiveRecord::Base
  attr_accessible :vehicle_type, :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id

  validates :vehicle_type, :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id, :presence => true
  validates :trip_id, :vehicle_id, :numericality => true
  validates :cost, :kilometres, :format => double
  validates :date, :format => date
  validates :maintenance_type, :inclusion => { :in => maintenance_type }
  validates :vehicle_type, :inclusion => { :in => vehicle_type }
end
