class JobPosting < ActiveRecord::Base
  attr_accessible :closing_date, :description, :post_date, :requirements, :title
end
