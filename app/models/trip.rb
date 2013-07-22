class Trip < ActiveRecord::Base
  attr_accessible :driver_pay, :end_date, :insurance, :kilometres_accumulated, :lease, :load_bar_count, :misc_cost, :start_date, :trailer_id, :truck_id

  validates :driver_pay, :end_date, :insurance, :kilometres_accumulated, :lease, :load_bar_count, :misc_cost, :start_date, :trailer_id, :truck_id, :presence => true
  validates :trailer_id, :truck_id, :load_bar_count, :numericality => true
  validates :driver_pay, :insurance, :kilometres_accumulated, :misc_cost, :format => double
  validates :end_date, :start_date, :format => date
  # lease
end
