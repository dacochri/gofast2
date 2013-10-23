class Quote
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActionView::Helpers::TextHelper
  
  attr_accessor :company, :name, :phone, :email, :pickup_time, :pickup_location, :delivery_time, :delivery_location, :weight, :footage, :skid_count, :details
  
  message = ValidationValues.message
  
  validates :company, :presence => true, :format => { :with => ValidationValues.company, :message => message }
  validates :name, :presence => true, :format => { :with => ValidationValues.alpha, :message => message }
  validates :phone, :presence => true, :numericality => true, :length => 10..11
  validates :email, :presence => true, :format => { :with => ValidationValues.email, :message => message}
  validates :pickup_location, :length => { :minimum => 3, :maximum => 1000 }, :format => { :with => ValidationValues.alpha_numeric, :message => message }
  validates :delivery_location, :length => { :minimum => 3, :maximum => 1000 }, :format => { :with => ValidationValues.alpha_numeric, :message => message }
  # validates :delivery_time, :pickup_time, :format => { :with => ValidationValues.date_time, :message => message }
  validates :details, :length => { :minimum => 0, :maximum => 1000 }, :format => { :with => ValidationValues.alpha_numeric, :message => message }#, :allow_blank => true
  
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
      :body => "Phone: " + phone + "Pickup Location: " + pickup_location + "Delivery Location: " + delivery_location + "Pickup Time: " + pickup_time + "Delivery Time: " + delivery_time + "Weight: " + weight + "Footage: " + footage + "Skid Count: " + skid_count + "Details: " + details,
      :html_body => simple_format("<h1>" + name + " from " + company + "</h1><br>" + "Phone: " + phone + "<br>Pickup Location: " + pickup_location + "<br>Delivery Location: " + delivery_location + "<br>Pickup Time: " + pickup_time + "<br>Delivery Time: " + delivery_time + "<br>Weight: " + weight + "<br>Footage: " + footage + "<br>Skid Count: " + skid_count + "<br>Details: " + details)
    })
  end
      
  def persisted?
    false
  end
end
