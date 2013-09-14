class Trip < ActiveRecord::Base
	include Searchable
  
  attr_accessible :cartage_id, :driver_id, :end_date, :expense_id, :kilometres_accumulated, :load_bar_count, :start_date, :trailer_id, :truck_id
  
  message = ValidationValues.message

  validates :end_date, :expense_id, :kilometres_accumulated, :load_bar_count, :start_date, :trailer_id, :truck_id, :presence => true
  validates :trailer_id, :truck_id, :load_bar_count, :expense_id, :numericality => true
  validates :kilometres_accumulated, :format => { :with => ValidationValues.double, :message => message }
  validates :end_date, :start_date, :format => { :with => ValidationValues.date, :message => message }
end
