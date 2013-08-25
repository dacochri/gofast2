class Shipment < ActiveRecord::Base
  attr_accessible :broker_id, :customer_id, :distance, :partial, :rate, :trip_id

  message = ValidationValues.message

  validates :broker_id, :customer_id, :distance, :rate, :trip_id, :presence => true
  validates :broker_id, :customer_id, :trip_id, :partial, :numericality => true
  validates :rate, :distance, :format => { :with => ValidationValues.double, :message => message }
end
