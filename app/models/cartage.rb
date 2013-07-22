class Cartage < ActiveRecord::Base
  attr_accessible :company_id, :cost, :delivery_time, :driver_name, :pickup_time, :shipment_id, :trailer_id

  validates :company_id, :cost, :delivery_time, :driver_name, :pickup_time, :shipment_id, :trailer_id, :presence => true
  validates :company_id, :shipment_id, :trailer_id, :numericality => true
  validates :cost, :format => double
  validates :driver_name, :format => name
  validates :delivery_time, :pickup_time, :format => date_time
end
