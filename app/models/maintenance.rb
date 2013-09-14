class Maintenance < ActiveRecord::Base
	include Searchable
  
  attr_accessible :vehicle_type, :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id

  message = ValidationValues.message

  validates :vehicle_type, :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id, :presence => true
  validates :trip_id, :vehicle_id, :numericality => true
  validates :cost, :kilometres, :format => { :with => ValidationValues.double, :message => message }
  validates :date, :format => { :with => ValidationValues.date, :message => message }
  validates :maintenance_type, :inclusion => { :in => %w(oil\ change brakes) }
  validates :vehicle_type, :inclusion => { :in => ValidationValues.vehicle_type }
end
