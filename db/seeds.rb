# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Company
Company.create(company_type: 'driver', name: 'Su Trucking Inc.', street: '23 Steeles Ave.', unit: '1B', city: 'Brampton', province: 'Ontario', postal_code: 'M6J 2N1', email: 'contact@sutrucking.com', primary_phone: '9054681245', secondary_phone: '', fax: '', contact_name: 'David Su')

# Truck
Truck.create(truck_no: '4821', truck_type: 'straight', license_plate: 'ABZM 293', license_expires: '2013-09-16', owner: '1', make: 'GM', model: 'X294', manufactured_year: '2005', vin_number: '368TU79MXH4763452', total_kilometres: '50926.25', current_location: '26 Steeles Ave. Brampton, ON, 2M1 6K7', color: 'Black')
