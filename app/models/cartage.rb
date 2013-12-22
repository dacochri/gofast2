# This file allows access to the database through the Cartage object.
# attr_accessible defines the attributes that are allowed to be used by creating accessor and mutator methods.
# This file also validates the data before it is submitted to the database.
# The values for validation are stored in /lib/validation_values.rb
class Cartage < ActiveRecord::Base
  include Searchable
  
  attr_accessible :company_id, :cost, :delivery_time, :driver_name, :pickup_time, :trailer_id

  message = ValidationValues.message
  
  validates :company_id, :cost, :delivery_time, :driver_name, :pickup_time, :trailer_id, :presence => true
  validates :company_id, :trailer_id, :numericality => true
  validates :cost, :format => { :with => ValidationValues.double, :message => message }
  validates :driver_name, :format => { :with => ValidationValues.name, :message => message }
  validates :delivery_time, :pickup_time, :format => { :with => ValidationValues.date_time, :message => message }
end
