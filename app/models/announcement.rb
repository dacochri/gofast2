# This file allows access to the database through the Announcement object.
# attr_accessible defines the attributes that are allowed to be used by creating accessor and mutator methods.
# This file also validates the data before it is submitted to the database.
# The values for validation are stored in /lib/validation_values.rb
class Announcement < ActiveRecord::Base
  include Searchable
  
  attr_accessible :content, :date_posted, :posted_by, :title

  message = ValidationValues.message
  
  validates :title, :content, :posted_by, :date_posted, :presence => true
  validates :date_posted, :format => { :with => ValidationValues.date_time, :message => message }
  validates :title, :content, :format => { :with => ValidationValues.content, :message => message }
end
