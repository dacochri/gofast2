class Driver < ActiveRecord::Base
  attr_accessible :business_name, :cell_phone, :city, :comments, :first_name, :home_phone, :hst_no, :last_name, :postal_code, :street, :trailer_id, :truck_id, :unit

  validates :city, :first_name, :last_name, :postal_code, :street, :presence => true
  validates :business_name, :format => company
  validates :cell_phone, :home_phone, :trailer_id, :truck_id, :numericality => true
  validates :cell_phone, :home_phone, :length => 10
  validates :first_name, :format => first_name
  validates :last_name, :foramt => last_name
  validates :street, :format => street
  validates :unit, :format => unit
  validates :postal_code, :format => postal_code
  validates :hst_no, :format => hst_no
end
