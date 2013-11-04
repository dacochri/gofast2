class Shipment < ActiveRecord::Base
	include Searchable
  
  attr_accessible :shipment_no, :trip_id, :broker_id, :shipper, :receiver, :cartage_id, :broker_date, :shipper_address, :receiver_address, :rate, :delivered, :invoice, :distance, :primary_driver, :secondary_driver, :primary_quick_pay, :secondary_quick_pay, :primary_driver_pay, :secondary_driver_pay, :misc_cost, :comments

  message = ValidationValues.message

  validates :shipment_no, :trip_id, :broker_id, :shipper, :receiver, :broker_date, :shipper_address, :receiver_address, :rate, :invoice, :distance, :primary_driver, :primary_driver_pay, :presence => true
  validates :shipment_no, :trip_id, :broker_id, :shipper, :receiver, :invoice, :distance, :primary_driver, :numericality => true
  validates :cartage_id, :secondary_driver, :numericality => true, :allow_blank => true
  validates :rate, :primary_driver_pay, :format => { :with => ValidationValues.double, :message => message }
  validates :primary_quick_pay, :secondary_quick_pay, :secondary_driver_pay, :misc_cost, :format => { :with => ValidationValues.double, :message => message }, :allow_blank => true
  validates :comments, :format => { :with => ValidationValues.content, :message => message }, :allow_blank => true
  validates :broker_date, :format => { :with => ValidationValues.date, :message => message }
  validates :shipper_address, :receiver_address, :format => { :with => ValidationValues.street, :message => message }
  validates :delivered, :inclusion => { :in => [true, false], :message => 'must be true or false' }, :allow_blank => true

  def shipment_no_and_receiver
    "#{shipment_no} for " + Company.find(receiver).name
  end
end
