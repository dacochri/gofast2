class Trip < ActiveRecord::Base
  attr_accessible :driver_pay, :end_date, :insurance, :kilometres_accumulated, :lease, :load_bar_count, :misc_cost, :start_date, :trailer_id, :truck_id
end
