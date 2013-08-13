class Maintenance < ActiveRecord::Base
	include Searchable
  attr_accessible :vehicle_type, :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id
end
