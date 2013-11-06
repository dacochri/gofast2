class Trip < ActiveRecord::Base
	include Searchable
  
  attr_accessible :truck_id, :trailer_id, :trip_no, :start_date, :end_date, :load_bar_count, :accumulated_kilometres, :fuel_cost, :misc_cost, :comments
  
  message = ValidationValues.message

  validates :truck_id, :trailer_id, :trip_no, :start_date, :end_date, :load_bar_count, :accumulated_kilometres, :fuel_cost, :presence => true
  validates :truck_id, :trailer_id, :trip_no, :load_bar_count, :accumulated_kilometres, :numericality => true
  validates :fuel_cost, :format => { :with => ValidationValues.double, :message => message }
  validates :misc_cost, :format => { :with => ValidationValues.double, :message => message }, :allow_blank => true
  validates :start_date, :end_date, :format => { :with => ValidationValues.date, :message => message }
  validates :comments, :format => { :with => ValidationValues.content, :message => message }, :allow_blank => true
  validates :trip_no, :uniqueness => true

  def trip_no_and_start_date_and_end_date
    "#{trip_no} -- #{start_date} to #{end_date}"
  end
end
