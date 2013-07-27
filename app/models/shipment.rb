class Shipment < ActiveRecord::Base
  attr_accessible :broker_id, :cartage_id, :customer_id, :distance, :driver_id, :partial, :rate, :shipment_no, :trip_id
end
