class JobPosting < ActiveRecord::Base
  attr_accessible :closing_date, :description, :post_date, :requirements, :title

  message = ValidationValues.message
  
  validates :closing_date, :description, :post_date, :requirements, :title, :presence => true
  validates :closing_date, :post_date, :format => { :with => ValidationValues.date, :message => message }
  validates :title, :requirements, :description, :format => { :with => ValidationValues.content, :message => message }
end
