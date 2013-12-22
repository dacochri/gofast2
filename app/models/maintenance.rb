# This file allows access to the database through the Maintenance object.
# attr_accessible defines the attributes that are allowed to be used by creating accessor and mutator methods.
# This file also validates the data before it is submitted to the database.
# The values for validation are stored in /lib/validation_values.rb
class Maintenance < ActiveRecord::Base
  include Searchable
  
  attr_accessible :vehicle_type, :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id

  message = ValidationValues.message

  validates :vehicle_type, :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id, :presence => true
  validates :trip_id, :vehicle_id, :numericality => true
  validates :cost, :format => { :with => ValidationValues.double, :message => message }
  validates :kilometres, :format => { :with => ValidationValues.integer, :message => message }
  validates :date, :format => { :with => ValidationValues.date, :message => message }
  validates :maintenance_type, :inclusion => { :in => ValidationValues.maintenance_type }
  validates :vehicle_type, :inclusion => { :in => ValidationValues.vehicle_type }
  validates :description, :format => { :with => ValidationValues.content, :message => message }
end
