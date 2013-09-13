class Announcement < ActiveRecord::Base
	include Searchable
  
  attr_accessible :content, :date_posted, :posted_by, :title
end
