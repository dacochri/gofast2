class Cartage < ActiveRecord::Base
  attr_accessible :company_id, :cost, :delivery_time, :driver_name, :pickup_time, :shipment_id, :trailer_id
end
