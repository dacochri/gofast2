class Announcement < ActiveRecord::Base
  attr_accessible :content, :date_posted, :posted_by, :title

  validates :title, :content, :posted_by, :presence => true
  validates :date_posted, :format => date_time
end
