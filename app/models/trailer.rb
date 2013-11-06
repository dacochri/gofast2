# This file allows access to the database through the Trailer object.
# attr_accessible defines the attributes that are allowed to be used by creating accessor and mutator methods.
# This file also validates the data before it is submitted to the database.
# The values for validation are stored in /lib/validation_values.rb
class Trailer < ActiveRecord::Base
  include Searchable
  
  attr_accessible :license_plate, :make, :manufactured_year, :model, :trailer_no, :trailer_type, :vin, :location, :color
  
  message = ValidationValues.message

  validates :license_plate, :make, :manufactured_year, :model, :trailer_no, :trailer_type, :vin, :location, :color, :presence => true
  validates :manufactured_year, :trailer_no, :numericality => true
  validates :model, :color, :format => { :with => ValidationValues.alpha_numeric, :message => message }
  validates :vin, :format => { :with => ValidationValues.vin, :message => message }, :uniqueness => true
  validates :trailer_type, :inclusion => { :in => ValidationValues.trailer_type }
  validates :location, :format => { :with => ValidationValues.street, :message => message }
  validates :license_plate, :length => 3..8, :format => { :with => ValidationValues.license_plate, :message => message }, :uniqueness => true
end
