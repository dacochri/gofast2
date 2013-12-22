# This file allows access to the database through the Skid object.
# attr_accessible defines the attributes that are allowed to be used by creating accessor and mutator methods.
# This file also validates the data before it is submitted to the database.
# The values for validation are stored in /lib/validation_values.rb
class Skid < ActiveRecord::Base
  include Searchable
  
  attr_accessible :delivery_location, :delivery_time, :oversized, :pickup_location, :pickup_time, :product_desc, :shipment_id, :skid_count, :weight, :unit

  message = ValidationValues.message

  validates :delivery_location, :delivery_time, :pickup_location, :pickup_time, :product_desc, :shipment_id, :skid_count, :weight, :unit, :presence => true
  validates :shipment_id, :skid_count, :oversized, :numericality => true
  validates :delivery_location, :pickup_location, :format => { :with => ValidationValues.street, :message => message }
  validates :delivery_time, :pickup_time, :format => { :with => ValidationValues.date_time, :message => message }
  validates :weight, :format => { :with => ValidationValues.double, :message => message }
  validates :unit, :inclusion => { :in => ValidationValues.unit }
  validates :product_desc, :format => { :with => ValidationValues.alpha_numeric, :message => message }
end
