class Shipment < ActiveRecord::Base
	include Searchable
  
  attr_accessible :broker_id, :customer_id, :distance, :partial, :rate, :shipment_no, :trip_id
end
