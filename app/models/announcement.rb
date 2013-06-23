class Announcement < ActiveRecord::Base
  attr_accessible :content, :date_posted, :posted_by, :title
end
