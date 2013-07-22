class JobPosting < ActiveRecord::Base
  attr_accessible :closing_date, :description, :post_date, :requirements, :title

  validates :closing_date, :description, :post_date, :requirements, :title, :presence => true
  validates :closing_date, :post_date, :format => date
end
