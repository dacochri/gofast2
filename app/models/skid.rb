class Skid < ActiveRecord::Base
  attr_accessible :delivery_location, :delivery_time, :oversized, :pickup_location, :pickup_time, :product_desc, :shipment_id, :skid_count, :warehouse_delivery_time, :warehouse_pickup_time, :weight

  validates :company_id, :delivery_location, :delivery_time, :oversized, :pickup_location, :pickup_time, :product_desc, :shipment_id, :skid_count, :warehouse_delivery_time, :warehouse_pickup_time, :weight, :presence => true
  validates :company_id, :shipment_id, :skid_count, :numericality => true
  validates :delivery_location, :pickup_location, :format => street
  validates :delivery_time, :pickup_time, :warehouse_delivery_time, :warehouse_pickup_time, :format => date_time
  validates :weight, :format => double
  validates :oversized, :inclusion => { :in => %w(true false) }
end
