# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Announcement.create(date_posted: '20130702', content: 'This is the body of the announcement', title: 'Intro Post', posted_by: '1')
Company.create(company_type: 'broker', name: 'Silvan Brokerage Inc.', street: '123 Anywhere Rd.', unit: '3B', city: 'Brampton', province: 'Ontario', postal_code: 'L9V 2K1', email: 'contact@silvanbrokerage.com', primary_phone: '18002663431', secondary_phone: '4169229898', fax: '4169222999', contact_name: 'John Bob')
Cartage.create(company_id: '1', trailer_id: '1', shipment_id: '1', pickup_time: '20130704', delivery_time: '20130708', driver_name: 'Bob', cost: '2140.00')
Skid.create(shipment_id: '1', company_id: '1', product_desc: 'chairs', weight: '2400.00', oversized: 'false', pickup_location: '2013 Sherman Heights Avenue', delivery_location: '99 Beach Street', pickup_time: '20130509', delivery_time: '20130510', warehouse_delivery_time: '20130511', warehouse_pickup_time: '20130512', skid_count: '12')
Shipment.create(broker_id: '1', driver_id: '2', customer_id: '3', trip_id: '1', shipment_no: '2058579', pickup_time: '20130505', delivery_time: '20130506', rate: '8900.63', skid_count: '12', partial: 'false', distance: '2690.88', cartage: 'true')
Trip.create(truck_id: '1', trailer_id: '1', start_date: '20130405', end_date: '20130406', load_bar_count: '5', lease: '2055.23', insurance: '1522.99', misc_cost: '495.87', kilometres_accumulated: '4985.66')
Maintenance.create(vehicle_id: '1', trip_id: '1', date: '20130508', cost: '1628.63', maintenance_type: 'service', description: 'routine service', kilometres: '2059.66')
JobPosting.create(title: 'Secretary', post_date: '20130505', closing_date: '20130605', description: 'Someone to manage paperwork.', requirements: 'Microsoft Word, Microsoft Excel')
Driver.create(truck_id: '1', trailer_id: '1', first_name: 'Bob', last_name: 'Oakes', street: '555 Morning Vista Rd.', unit: '', city: 'Red Deer Lake', postal_code: 'V5V 2O9', home_phone: '5556669999', cell_phone: '5467742635', business_name: 'Underwood Trucking', hst_no: '55865B5E26', comments: '')
Truck.create(last_service_id: '1', last_safety_id: '2', truck_no: '54', truck_type: 'refrigerator', license_plate: 'G8E 8H9', license_expires: '20131122', owned: 'false', make: 'GM', model: 'PM 22', manufactured_year: '2005', vin_number: '654D4548EG54HT842', next_service_kilometres: '50000', next_safety_date: '20131215', total_kilometres: '23589')
Trailer.create(last_service_id: '3', last_safety_id: '4', trailer_no: '23', trailer_type: 'refrigerator', license_plate: 'M5N 6V2', make: 'GM', model: 'Intrepid 55', manufactured_year: '2005', vin_number: '559445185D6GER5', next_service_date: '20130910', next_safety_date: '20131110')
