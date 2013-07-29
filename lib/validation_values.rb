class ValidationValues
  double = /\A\d+\.\d{2}\Z/
  alpha = /[A-Za-z]+/
  alpha_numeric = /[A-Za-z0-9]+/
  
  first_name = /[A-Za-z ]+/
  last_name = /[A-Za-z' ]+/
  name = last_name
  company = /[A-Za-z. ]+/
  city = /[A-Za-z'. ]+/
  street = /\d{1-4} [A-Za-z. ]+/
  unit = /[A-Z0-9 ]+/
  license_plate = /[A-Z0-9 ]{3,8}/
  hst_no = /[A-Z0-9]+/
  date = /\A\d{4}(-\d{2}){2}\Z/
  date_time = /\A\d{4}(-\d{2}){2} \d{4}(:\d{2}){2}\Z/
  email = /\b[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Z]{2,4}\b/

  province = %w(Alberta British\ Columbia Manitoba New\ Brunswick Newfoundland\ and\ Labrador Nova\ Scotia Ontario Prince\ Edward\ Island Quebec Saskatchewan Northwest\ Territories Nunavut Yukon)
  vehicle_type = %w(truck trailer)
  vehicle_sub_type = %w(refrigerator straight)
end
