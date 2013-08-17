class Announcement < ActiveRecord::Base
  attr_accessible :content, :date_posted, :posted_by, :title

  message = ValidationValues.message
  
  validates :title, :content, :posted_by, :date_posted, :presence => true
  validates :date_posted, :format => { :with => ValidationValues.date_time, :message => message }
  validates :title, :content, :format => { :with => ValidationValues.content, :message => message }
end
