class Skid < ActiveRecord::Base
  attr_accessible :delivery_location, :delivery_time, :oversized, :pickup_location, :pickup_time, :product_desc, :shipment_id, :skid_count, :warehouse_delivery_time, :warehouse_pickup_time, :weight
end
