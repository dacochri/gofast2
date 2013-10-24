class ValidationValues
  # General Regexs
  @integer = /\d+/
  @double = /\d+\.?\d{0,2}/
  @alpha = /[A-Za-z ]+/
  @alpha_numeric = /[A-Za-z0-9 ]+/
  @content = /[A-Za-z0-9,.;'!@#\$%^&*()_=+|]+/

  # Specific Regexs
  @name = /[A-Za-z' ]+/
  @company = /[A-Za-z.\- ]+/
  @city = /[A-Za-z'. ]+/
  @street = /\d{0,4} ?[A-Za-z0-9,. ]+/
  @address_unit = /[A-Z0-9 ]+/
  @license_plate = /[A-Z0-9 ]+/
  @hst_no = /[A-Z0-9]+/
  @date = /\A\d{4}(-\d{2}){2}\Z/
  @date_time = /\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}\sUTC/
  @email = /[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}/
  @postal_code = /[A-Za-z][0-9][A-Za-z]\s[0-9][A-Za-z][0-9]/
  @year = /\d{4}/
  @vin = /([A-HJ-NPR-Z]|\d){11}\d{6}/

  # List of acceptable words
  @province = %w(Alberta British\ Columbia Manitoba New\ Brunswick Newfoundland\ and\ Labrador Nova\ Scotia Ontario Prince\ Edward\ Island Quebec Saskatchewan Northwest\ Territories Nunavut Yukon)
  @vehicle_type = %w(truck trailer)
  @truck_type = %w(straight tractor)
  @trailer_type = %w(53ft\ logistic\ airride\ dryvan 53ft\ reefer)
  @company_type = %w(customer mechanic broker cartage driver misc)
  @maintenance_type = %w(oil\ change brakes)
  @unit = %w(lb kg)

  # Messages
  @message = 'does not match expected format'
  
  # General Regexs for client side validation
  @c_integer = '\d+'
  @c_double = '\d+\.?\d{0,2}'
  @c_date = '\A\d{4}-\d{2}-\d{2}\Z'
  @c_alpha = '[A-Za-z ]+'
  @c_alpha_numeric = '[A-Za-z0-9 ]+'
  @c_content = '[A-Za-z0-9,.;\'!@#\$%^&*()_=+|]+'
  
  @c_license_plate = '[A-Za-z0-9]+'
  @c_year = '\d{4}+'
  @c_vin = '([A-HJ-NPR-Z]|\d){11}\d{6}'
  @c_street = '\d{0,4} ?[A-Za-z0-9,. ]+'

  # Placeholder values
  @p_integer = '4865'
  @p_double = '1234.56'
  @p_date = 'YYYY-MM-DD'
  @p_product_desc = 'Shoes'
  @p_street = '26 Steeles Ave. W, Brampton, ON, M4V 2K1'
  @p_license_plate = 'ABZM 264'
  @p_year = '2005'
  @p_vin = '368TU79MXH4763452'
  @p_color = 'Black'
  @p_name = 'John Doe'

  # Get methods
  def self.integer
    @integer
  end

  def self.double
    @double
  end

  def self.alpha
    @alpha
  end

  def self.alpha_numeric
    @alpha_numeric
  end
  
  def self.content
    @content
  end

  def self.name
    @name
  end

  def self.company
    @company
  end

  def self.city
    @city
  end

  def self.street
    @street
  end

  def self.address_unit
    @address_unit
  end

  def self.license_plate
    @license_plate
  end

  def self.hst_no
    @hst_no
  end

  def self.date
    @date
  end

  def self.date_time
    @date_time
  end

  def self.email
    @email
  end
  
  def self.postal_code
    @postal_code
  end

  def self.year
    @year
  end

  def self.vin
    @vin
  end

  def self.province
    @province
  end

  def self.vehicle_type
    @vehicle_type
  end

  def self.truck_type
    @truck_type
  end

  def self.trailer_type
    @trailer_type
  end
  
  def self.company_type
    @company_type
  end

  def self.maintenance_type
    @maintenance_type
  end

  def self.unit
    @unit
  end

  def self.message
    @message
  end

  def self.c_integer
    @c_integer
  end

  def self.c_double
    @c_double
  end

  def self.c_date
    @c_date
  end
  
  def self.c_alpha
    @c_alpha
  end

  def self.c_alpha_numeric
    @c_alpha_numeric
  end

  def self.c_content
    @c_content
  end

  def self.c_license_plate
    @c_license_plate
  end

  def self.c_street
    @c_street
  end

  def self.c_year
    @c_year
  end

  def self.c_vin
    @c_vin
  end
  
  def self.p_integer
    @p_integer
  end

  def self.p_double
    @p_double
  end

  def self.p_date
    @p_date
  end

  def self.p_street
    @p_street
  end

  def self.p_license_plate
    @p_license_plate
  end

  def self.p_year
    @p_year
  end

  def self.p_vin
    @p_vin
  end

  def self.p_color
    @p_color
  end

  def self.p_name
    @p_name
  end

  def self.p_product_desc
    @p_product_desc
  end
end
