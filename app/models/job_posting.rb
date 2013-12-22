# This file allows access to the database through the JobPosting object.
# attr_accessible defines the attributes that are allowed to be used by creating accessor and mutator methods.
# This file also validates the data before it is submitted to the database.
# The values for validation are stored in /lib/validation_values.rb
class JobPosting < ActiveRecord::Base
  include Searchable
  
  attr_accessible :closing_date, :description, :post_date, :requirements, :title

  message = ValidationValues.message
  
  validates :closing_date, :description, :post_date, :requirements, :title, :presence => true
  validates :closing_date, :post_date, :format => { :with => ValidationValues.date, :message => message }
  validates :title, :requirements, :description, :format => { :with => ValidationValues.content, :message => message }
end
