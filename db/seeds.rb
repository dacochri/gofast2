# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Driver
Driver.create(first_name: 'Simon', last_name: 'Smith', street: '22 Lawrence Ave.', unit: '', city: 'Brampton', postal_code: 'S6I 2M1', home_phone: '9058761452', cell_phone: '4168795522', business_name: 'Simon Trucking Enterprises', hst_no: '44f4e4fe5', comments: '')

# Truck
Truck.create(truck_no: '5448562', vin_no: '45f4e54', truck_type: 'straight', license_plate: '5485 ABC', license_expires: '2013-08-09', owner: '1', make: 'GMC', model: '5441d2', manufactured_year: '2005', total_kilometeres: '52000.00', current_location: '566 Steeles Ave., Brampton, ON, H4F 5E8')
