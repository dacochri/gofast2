class TripRoster < ActiveRecord::Base
	include Searchable
  
  attr_accessible :shipment_id, :trip_id
end
