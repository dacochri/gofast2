class Maintenance < ActiveRecord::Base
  attr_accessible :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id
end
