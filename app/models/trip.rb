class Trip < ActiveRecord::Base
	include Searchable
  
  attr_accessible :truck_id, :trailer_id, :start_date, :end_date, :load_bar_count, :accumulated_kilometres, :fuel_cost, :misc_cost, :comments
  
  message = ValidationValues.message

  validates :truck_id, :trailer_id, :start_date, :end_date, :load_bar_count, :accumulated_kilometres, :fuel_cost, :presence => true
  validates :truck_id, :trailer_id, :load_bar_count, :accumulated_kilometres, :numericality => true
  validates :fuel_cost, :format => { :with => ValidationValues.double, :message => message }
  validates :misc_cost, :format => { :with => ValidationValues.double, :message => message }, :allow_blank => true
  validates :start_date, :end_date, :format => { :with => ValidationValues.date, :message => message }
  validates :comments, :format => { :with => ValidationValues.content, :message => message }, :allow_blank => true
end
