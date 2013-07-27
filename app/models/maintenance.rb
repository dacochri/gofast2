class Maintenance < ActiveRecord::Base
  attr_accessible :vehicle_type, :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id
end
