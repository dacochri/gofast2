class Trip < ActiveRecord::Base
  attr_accessible :end_date, :expense_id, :kilometres_accumulated, :load_bar_count, :start_date, :trailer_id, :truck_id

  validates :end_date, :expense_id, :kilometres_accumulated, :load_bar_count, :start_date, :trailer_id, :truck_id, :presence => true
  validates :trailer_id, :truck_id, :load_bar_count, :expense_id, :numericality => true
  validates :kilometres_accumulated, :format => double
  validates :end_date, :start_date, :format => date
end
