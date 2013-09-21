class Shipment < ActiveRecord::Base
	include Searchable
  
  attr_accessible :broker_id, :cartage_id, :customer_id, :distance, :partial, :rate, :shipment_no, :trip_id

  message = ValidationValues.message

  validates :broker_id, :customer_id, :distance, :rate, :trip_id, :shipment_no, :presence => true
  validates :broker_id, :customer_id, :trip_id, :partial, :shipment_no, :cartage_id, :numericality => true
  validates :rate, :distance, :format => { :with => ValidationValues.double, :message => message }
  validates :cartage_id, :numericality => true, :allow_blank => true
end
