class Shipment < ActiveRecord::Base
  attr_accessible :broker_id, :cartage, :customer_id, :delivery_time, :distance, :driver_id, :partial, :pickup_time, :rate, :shipment_no, :skid_count, :trip_id

  validates :broker_id, :cartage, :customer_id, :delivery_time, :distance, :driver_id, :partial, :pickup_time, :rate, :shipment_no, :skid_count, :trip_id, :presence => true
  validates :broker_id, :customer_id, :driver_id, :shipment_no, :skid_count, :trip_id, :numericality => true
  validates :cartage, :rate, :distance, :format => double
  validates :delivery_time, :pickup_time, :format => date_time
end
