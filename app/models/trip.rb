class Trip < ActiveRecord::Base
  attr_accessible :driver_pay, :end_date, :expense_id, :kilometres_accumulated, :load_bar_count, :start_date, :trailer_id, :truck_id
end
