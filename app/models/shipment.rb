class Shipment < ActiveRecord::Base
  attr_accessible :broker_id, :customer_id, :distance, :partial, :rate, :trip_id
end
