class Truck < ActiveRecord::Base
	include Searchable
  
  attr_accessible :license_expires, :license_plate, :make, :manufactured_year, :model, :owner, :total_kilometres, :truck_no, :truck_type, :vin_number, :current_location, :photo
  
  has_attached_file :photo

  message = ValidationValues.message

  validates :make, :manufactured_year, :model, :owner, :total_kilometres, :truck_type, :vin_number, :current_location, :presence => true
  validates :manufactured_year, :owner, :numericality => true
  validates :manufactured_year, :length => 4..4
  validates :truck_no, :numericality => true, :allow_blank => true
  validates :license_expires, :format => { :with => ValidationValues.date, :message => message }, :allow_blank => true
  validates :total_kilometres, :format => { :with => ValidationValues.double, :message => message }
  validates :make, :model, :format => { :with => ValidationValues.alpha_numeric, :message => message }
  validates :vin_number, :format => { :with => ValidationValues.vin, :message => message }
  validates :current_location, :format => { :with => ValidationValues.street, :message => message }
  validates :license_plate, :format => { :with => ValidationValues.license_plate, :message => message }, :length => 3..8, :allow_blank => true
  validates :truck_type, :inclusion => { :in => ValidationValues.truck_type }
  validates_attachment_size :photo, :less_than => 1.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
