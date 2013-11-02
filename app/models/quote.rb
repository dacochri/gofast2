class Quote
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActionView::Helpers::TextHelper
  
  attr_accessor :company, :name, :phone, :email, :pickup_date, :pickup_street, :pickup_city, :pickup_province, :pickup_postal_code, :delivery_date, :delivery_street, :delivery_city, :delivery_province, :delivery_postal_code, :weight, :unit, :footage, :skid_count, :details
  
  message = ValidationValues.message
  
  validates :company, :presence => true, :format => { :with => ValidationValues.company, :message => message }
  validates :name, :presence => true, :format => { :with => ValidationValues.name, :message => message }
  validates :phone, :presence => true, :numericality => true, :length => 10..11
  validates :email, :presence => true, :format => { :with => ValidationValues.email, :message => message}
  validates :pickup_date, :format => { :with => ValidationValues.date, :message => message }
  validates :pickup_street, :presence => true, :length => { :minimum => 3, :maximum => 200 }, :format => { :with => ValidationValues.street, :message => message }
  validates :pickup_city, :presence => true, :length => { :minimum => 3, :maximum => 100 }, :format => { :with => ValidationValues.city, :message => message }
  validates :pickup_province, :presence => true, :length => { :minimum => 3, :maximum => 20}, :inclusion => { :in => ValidationValues.province }
  validates :pickup_postal_code, :presence => true, :length => { :minimum => 6, :maximum => 7 }, :format => { :with => ValidationValues.postal_code, :message => message }
  validates :delivery_date, :format => { :with => ValidationValues.date, :message => message }
  validates :delivery_street, :presence => true, :length => { :minimum => 3, :maximum => 200 }, :format => { :with => ValidationValues.street, :message => message }
  validates :delivery_city, :presence => true, :length => { :minimum => 3, :maximum => 100 }, :format => { :with => ValidationValues.city, :message => message }
  validates :delivery_province, :presence => true, :length => { :minimum => 3, :maximum => 20}, :inclusion => { :in => ValidationValues.province }
  validates :delivery_postal_code, :presence => true, :length => { :minimum => 6, :maximum => 7 }, :format => { :with => ValidationValues.postal_code, :message => message }
  validates :weight, :format => { :with => ValidationValues.double, :message => message }
  validates :unit, :inclusion => { :in => ValidationValues.unit }
  validates :footage, :numericality => true, :length => 0..10
  validates :skid_count, :numericality => true, :length => 0..10
  validates :details, :format => { :with => ValidationValues.content, :message => message }, :allow_blank => true
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
    
  def deliver
    return false unless valid?
    Pony.mail({
      :from => %("#{name}" <#{email}>),
      :reply_to => email,
      :subject => name + " from " + company,
      :body => "Phone: " + phone + "\nE-mail: " + email + "\nPickup Location: " + pickup_street + " " + pickup_city + " " + pickup_province + " " + pickup_postal_code + "\nDelivery Location: " + delivery_street + " " + delivery_city + " " + delivery_province + " " + delivery_postal_code + "\nPickup Time: " + pickup_date + "\nDelivery Time: " + delivery_date + "\nWeight: " + weight + unit + "\nFootage: " + footage + "\nSkid Count: " + skid_count + "\nDetails: " + details,
      :html_body => simple_format("<h2>" + name + " from " + company + "</h2><br>" + "<h3>Phone: " + phone + " E-mail: " + email + "</h3>" + "<br>Pickup Location: " + pickup_street + " " + pickup_city + " " + pickup_province + " " + pickup_postal_code + "<br>Delivery Location: " + delivery_street + " " + delivery_city + " " + delivery_province + " " + delivery_postal_code + "<br>Pickup Time: " + pickup_date + "<br>Delivery Time: " + delivery_date + "<br>Weight: " + weight + unit + "<br>Footage: " + footage + "<br>Skid Count: " + skid_count + "<br>Details: " + details)
    })
  end
      
  def persisted?
    false
  end
end
