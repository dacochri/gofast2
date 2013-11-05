class JobApplication 
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActionView::Helpers::TextHelper
  
  # get/set method
  attr_accessor :title, :job, :name, :phone, :email, :resume, :resume_file
  #has_attached_file :resume_file
  message = ValidationValues.message
  
  # validation for all fields
  #validates_attachment_content_type :resume_file, :content_type => ['application/pdf', 'application/msword']
  validates :job, :format => { :with => ValidationValues.content, :message => message }
  validates :name, :presence => true, :format => { :with => ValidationValues.name, :message => message }
  validates :phone, :presence => true, :numericality => true, :length => 10..10
  validates :email, :presence => true, :format => { :with => ValidationValues.email, :message => message}
  validates :resume, :format => { :with => ValidationValues.content, :message => message }
  
  #allows passing of attribute values
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  #e-mail logic
  def deliver
    return false unless valid?
    Pony.mail({
      :from => %("#{name}" <#{email}>),
      :reply_to => email,
      :subject => name + " applying for " + job,
      :body => "Phone: " + phone + "\nE-mail: " + email + "\nResume: " + resume,
      :html_body => simple_format("<h2>" + name + " has applied for " + job + "</h2><br>" + "<h3>Phone: " + phone + " E-mail: " + email + "</h3>" + "<br>Resume: " + resume),
      :attachments => { resume_file.original_filename => resume_file.read }
    })
  end
  
  #tells form that there's no storage of this data
  def persisted?
    false
  end
end
