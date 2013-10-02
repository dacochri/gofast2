# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Company
Company.create(company_type: 'misc', name: 'GoFast Express Inc', street: '2871 Slough Street', unit: '', city: 'Mississuaga', province: 'Ontario', postal_code: 'M6J 2N1', email: 'contact@sutrucking.com', primary_phone: '9054681245', secondary_phone: '', fax: '', contact_name: 'David Su')

# Truck
Truck.create(truck_no: '1001', truck_type: 'straight', license_plate: '1227YM', license_expires: '2014-09-16', owner: '1', make: 'Hino', model: 'Classic', manufactured_year: '2004', vin_number: 'JHBFB4JH441S12911', total_kilometres: '1100000', current_location: '2871 Slough Street')
Truck.create(truck_no: '1002', truck_type: 'straight', license_plate: '4013PL', license_expires: '2014-09-16', owner: '1', make: 'Volvo', model: 'Classic', manufactured_year: '2005', vin_number: '4V4NC9GH15N373799', total_kilometres: '1400000', current_location: '2871 Slough Street')
Truck.create(truck_no: '1003', truck_type: 'straight', license_plate: '6684PF', license_expires: '2014-09-16', owner: '1', make: 'Kenworth', model: 'Classic', manufactured_year: '2003', vin_number: '1XKWSB9X03J067589', total_kilometres: '1800000', current_location: '2871 Slough Street')
Truck.create(truck_no: '1004', truck_type: 'straight', license_plate: '6973YF', license_expires: '2014-09-16', owner: '1', make: 'International', model: 'Classic', manufactured_year: '2003', vin_number: '1HSHXAHR13J074184', total_kilometres: '1850000', current_location: '2871 Slough Street')
Truck.create(truck_no: '1005', truck_type: 'straight', license_plate: 'AB31276', license_expires: '2014-09-16', owner: '1', make: 'Mitsubishi', model: 'Classic', manufactured_year: '2004', vin_number: 'JHBFB4JH441S12911', total_kilometres: '1800000', current_location: '2871 Slough Street')
