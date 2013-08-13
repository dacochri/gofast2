class JobPosting < ActiveRecord::Base
	include Searchable
  attr_accessible :closing_date, :description, :post_date, :requirements, :title
end
