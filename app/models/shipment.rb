class Shipment < ActiveRecord::Base
  attr_accessible :broker_id, :cartage, :customer_id, :delivery_time, :distance, :driver_id, :partial, :pickup_time, :rate, :shipment_no, :skid_count, :trip_id
end
