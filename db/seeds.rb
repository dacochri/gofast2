# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Announcements
Announcement.create(date_posted: '20130702', content: 'This is the body of the announcement', title: 'First Announcement', posted_by: '1')
Announcement.create(date_posted: '20130702', content: 'This is the body of the announcement', title: 'Second Announcement', posted_by: '1')
Announcement.create(date_posted: '20130702', content: 'This is the body of the announcement', title: 'Third Announcement', posted_by: '1')
Announcement.create(date_posted: '20130702', content: 'This is the body of the announcement', title: 'Fourth Announcement', posted_by: '1')
Announcement.create(date_posted: '20130702', content: 'This is the body of the announcement', title: 'Fifth Announcement', posted_by: '1')

#Cartages
Cartage.create(company_id: '1', trailer_id: '1', shipment_id: '1', pickup_time: '20130704', delivery_time: '20130705', driver_name: 'Bob', cost: '2140.00')
Cartage.create(company_id: '2', trailer_id: '2', shipment_id: '2', pickup_time: '20130705', delivery_time: '20130706', driver_name: 'John', cost: '3000.00')
Cartage.create(company_id: '3', trailer_id: '4', shipment_id: '3', pickup_time: '20130706', delivery_time: '20130707', driver_name: 'Dave', cost: '1140.40')
Cartage.create(company_id: '2', trailer_id: '4', shipment_id: '4', pickup_time: '20130707', delivery_time: '20130708', driver_name: 'Jack', cost: '2220.00')
Cartage.create(company_id: '3', trailer_id: '5', shipment_id: '5', pickup_time: '20130708', delivery_time: '20130709', driver_name: 'Billy', cost: '1563.50')

#Companies
Company.create(company_type: 'broker', name: 'Silvan Brokerage Inc.', street: '123 Anywhere Rd.', unit: '3B', city: 'Brampton', province: 'Ontario', postal_code: 'L9V 2K1', email: 'contact@silvanbrokerage.com', primary_phone: '18002663431', secondary_phone: '4169229898', fax: '4169222999', contact_name: 'John Black')
Company.create(company_type: 'broker', name: 'Fast Loads Corp.', street: '5400 Broker Lane', unit: '', city: 'Mississuaga', province: 'Ontario', postal_code: 'J5H 3L4', email: 'support@fastloads.com', primary_phone: '18005846321', secondary_phone: '4166875910', fax: '4165557841', contact_name: 'Jane Smith')
Company.create(company_type: 'broker', name: 'Shippers Inc.', street: '1243 Sky Street', unit: '2', city: 'Etobicoke', province: 'Ontario', postal_code: 'Y7B 4M9', email: 'loads@shippers.com', primary_phone: '18009469534', secondary_phone: '4168631498', fax: '4166365482', contact_name: 'David Hastings')
Company.create(company_type: 'customer', name: 'Zellers', street: '75 McFaster Rd', unit: '12', city: 'Oakvile', province: 'Ontario', postal_code: 'D8L 3K8', email: 'support@zellers.com', primary_phone: '18003578513', secondary_phone: '9052753358', fax: '9052351048', contact_name: 'Art Lancer')
Company.create(company_type: 'vendor', name: 'Easy Tools Corp.', street: '367 Jolly Court', unit: '21', city: 'Hamilton', province: 'Ontario', postal_code: 'K5G 1S6', email: 'shipping@easytools.com', primary_phone: '18005796428', secondary_phone: '9058636861', fax: '9053758204', contact_name: 'Lucy Doe')

#Drivers
Driver.create(first_name: 'Steve', last_name: 'Davis', street: '555 Morning Vista Rd.', unit: '', city: 'Red Deer Lake', postal_code: 'V5V 2O9', home_phone: '5556669999', cell_phone: '5467742635', business_name: 'Underwood Trucking', hst_no: '55865B5E26', comments: 'New Driver')
Driver.create(first_name: 'Max', last_name: 'Crimly', street: '27 Cheery Road', unit: '', city: 'Austin', postal_code: 'C4F 5J1', home_phone: '23247645673', cell_phone: '9702648259', business_name: 'Jarkson Trucking', hst_no: '54865C3R23', comments: 'Good Driver')
Driver.create(first_name: 'Harry', last_name: 'Oakes', street: '2630 Drinkwater Ave.', unit: '', city: 'Georgetown', postal_code: 'K7H 3G9', home_phone: '4525761848', cell_phone: '5894357658', business_name: 'NL Trucking', hst_no: '25468D5J26', comments: 'Drives too Fast')
Driver.create(first_name: 'Hugo', last_name: 'Johnes', street: '1835 Lancer Street.', unit: '', city: 'Sunnyville', postal_code: 'P0H 3B6', home_phone: '9275037563', cell_phone: '6485219765', business_name: 'Boxster Trucking', hst_no: '26867C5N76', comments: 'Needs Training')
Driver.create(first_name: 'Marco', last_name: 'Polo', street: '135 Jackie Court', unit: '', city: 'Dark Creek', postal_code: 'M2C 7H1', home_phone: '8572957830', cell_phone: '1852654862', business_name: 'Welson Trucking', hst_no: '51668F5H36', comments: 'Professional')

#Expenses
Expense.create(quick_pay: '200', fuel: '675.46', driver_pay: '487.76', misc_cost: '436.75')
Expense.create(quick_pay: '156', fuel: '591.89', driver_pay: '421.54', misc_cost: '416.25')
Expense.create(quick_pay: '0', fuel: '573.56', driver_pay: '386.25', misc_cost: '395.25')
Expense.create(quick_pay: '183', fuel: '682.25', driver_pay: '502.54', misc_cost: '387.45')
Expense.create(quick_pay: '239', fuel: '613.64', driver_pay: '492.25', misc_cost: '396.36')

#Job Postings
JobPosting.create(title: 'Secretary', post_date: '20130505', closing_date: '20130705', description: 'Someone to manage paperwork.', requirements: 'Microsoft Word, Microsoft Excel')
JobPosting.create(title: 'Driver', post_date: '20130506', closing_date: '20130706', description: 'Truck Driver for Long Hauls', requirements: 'A-Z Drivers Licence, 3 years of experience minimum')
JobPosting.create(title: 'Driver', post_date: '20130507', closing_date: '20130707', description: 'Truck Driver for Long Hauls.', requirements: 'A-Z Drivers Licence, 3 years of experience minimum')
JobPosting.create(title: 'Driver', post_date: '20130508', closing_date: '20130708', description: 'Truck Driver for Town Delivery', requirements: 'A-Z Drivers Licence, 2 years of experience minimum')
JobPosting.create(title: 'Worker', post_date: '20130509', closing_date: '20130709', description: 'Someone to manage paperwork.', requirements: 'Load and Unload trucks, Forklift licence required')

#Maintenances
Maintenance.create(vehicle_id: '1', trip_id: '', date: '20130508', cost: '250.00', maintenance_type: 'oil change', description: 'routine oil change', kilometres: '2059.66', vehicle_type: 'truck')
Maintenance.create(vehicle_id: '2', trip_id: '', date: '20130509', cost: '300.00', maintenance_type: 'safety', description: 'routine safety inspection', kilometres: '2059.66', vehicle_type: 'truck')
Maintenance.create(vehicle_id: '2', trip_id: '', date: '20130409', cost: '300.00', maintenance_type: 'safety', description: 'routine safety inspection', kilometres: '2059.66', vehicle_type: 'trailer')
Maintenance.create(vehicle_id: '4', trip_id: '1', date: '20130418', cost: '1628.63', maintenance_type: 'service', description: 'A/C not working', kilometres: '2059.66', vehicle_type: 'truck')
Maintenance.create(vehicle_id: '5', trip_id: '', date: '20130422', cost: '250.00', maintenance_type: 'oil change', description: 'routine oil change', kilometres: '2059.66', vehicle_type: 'truck')

#shipments
Shipment.create(broker_id: '1', driver_id: '1', customer_id: '4', trip_id: '1', cartage_id: '', rate: '3300.63', partial: 'false', distance: '2190.88')
Shipment.create(broker_id: '2', driver_id: '1', customer_id: '4', trip_id: '1', cartage_id: '4', rate: '4900.63', partial: 'false', distance: '1890.88')
Shipment.create(broker_id: '3', driver_id: '2', customer_id: '4', trip_id: '2', cartage_id: '', rate: '5000.63', partial: 'false', distance: '1690.88')
Shipment.create(broker_id: '2', driver_id: '2', customer_id: '4', trip_id: '2', cartage_id: '5', rate: '2500.63', partial: 'false', distance: '1590.88')
Shipment.create(broker_id: '1', driver_id: '2', customer_id: '4', trip_id: '2', cartage_id: '1', rate: '3900.63', partial: 'false', distance: '2690.88')
Shipment.create(broker_id: '1', driver_id: '3', customer_id: '4', trip_id: '3', cartage_id: '', rate: '4500.63', partial: 'false', distance: '1890.88')
Shipment.create(broker_id: '1', driver_id: '3', customer_id: '4', trip_id: '3', cartage_id: '', rate: '4500.63', partial: 'false', distance: '1890.88')
Shipment.create(broker_id: '2', driver_id: '4', customer_id: '4', trip_id: '3', cartage_id: '2', rate: '3500.63', partial: 'false', distance: '1890.88')
Shipment.create(broker_id: '2', driver_id: '4', customer_id: '4', trip_id: '4', cartage_id: '', rate: '3500.63', partial: 'false', distance: '1890.88')
Shipment.create(broker_id: '3', driver_id: '5', customer_id: '4', trip_id: '5', cartage_id: '', rate: '5500.63', partial: 'false', distance: '1890.88')
Shipment.create(broker_id: '3', driver_id: '5', customer_id: '4', trip_id: '5', cartage_id: '3', rate: '5500.63', partial: 'false', distance: '1890.88')

#Skids
Skid.create(shipment_id: '1', product_desc: 'Cool Stuff', weight: '300', oversized: 'false', pickup_location: '123 Karaoke Street', delivery_location: '321 Georgetown', pickup_time: '20130702 202123', delivery_time: '20130708 102000', warehouse_delivery_time: '', warehouse_pickup_time: '', skid_count: '6')
Skid.create(shipment_id: '1', product_desc: 'Cool Stuff', weight: '300', oversized: 'false', pickup_location: '7845 Macao Ave.', delivery_location: '65 Blossom Drive', pickup_time: '20130702 202123', delivery_time: '20130708 102000', warehouse_delivery_time: '', warehouse_pickup_time: '', skid_count: '8')
Skid.create(shipment_id: '2', product_desc: 'Cool Stuff', weight: '300', oversized: 'false', pickup_location: '423 Bluefin Drive', delivery_location: '392 Stock Street', pickup_time: '20130703 202123', delivery_time: '20130709 102000', warehouse_delivery_time: '', warehouse_pickup_time: '', skid_count: '5')
Skid.create(shipment_id: '2', product_desc: 'Cool Stuff', weight: '300', oversized: 'false', pickup_location: '7434 Cherry Rd.', delivery_location: '45 Glance Crescent', pickup_time: '20130703 202123', delivery_time: '20130709 102000', warehouse_delivery_time: '', warehouse_pickup_time: '', skid_count: '6')
Skid.create(shipment_id: '2', product_desc: 'Cool Stuff', weight: '300', oversized: 'false', pickup_location: '5894 Lance Street', delivery_location: '38 Winston Ave', pickup_time: '20130703 202123', delivery_time: '20130709 102000', warehouse_delivery_time: '', warehouse_pickup_time: '', skid_count: '4')
Skid.create(shipment_id: '3', product_desc: 'Cool Stuff', weight: '300', oversized: 'false', pickup_location: '1587 Chinatown', delivery_location: '64 Jimly Crescent', pickup_time: '20130702 202123', delivery_time: '20130708 102000', warehouse_delivery_time: '', warehouse_pickup_time: '', skid_count: '8')
Skid.create(shipment_id: '3', product_desc: 'Cool Stuff', weight: '300', oversized: 'false', pickup_location: '23 Drinkwater Ave', delivery_location: '564 Tango Street', pickup_time: '20130702 202123', delivery_time: '20130708 102000', warehouse_delivery_time: '', warehouse_pickup_time: '', skid_count: '7')
Skid.create(shipment_id: '4', product_desc: 'Cool Stuff', weight: '300', oversized: 'false', pickup_location: '89 Pilgrim Drive', delivery_location: '4823 Plur Street', pickup_time: '20130703 202123', delivery_time: '20130709 102000', warehouse_delivery_time: '', warehouse_pickup_time: '', skid_count: '4')
Skid.create(shipment_id: '4', product_desc: 'Cool Stuff', weight: '300', oversized: 'false', pickup_location: '938 Dock Street', delivery_location: '86 Hawaki Drive', pickup_time: '20130703 202123', delivery_time: '20130709 102000', warehouse_delivery_time: '', warehouse_pickup_time: '', skid_count: '12')
Skid.create(shipment_id: '5', product_desc: 'Cool Stuff', weight: '300', oversized: 'false', pickup_location: '589 Watermark Ave.', delivery_location: '9 Tisky Drive', pickup_time: '20130702 202123', delivery_time: '20130708 102000', warehouse_delivery_time: '', warehouse_pickup_time: '', skid_count: '18')

#Trailers
Trailer.create(trailer_no: '1', trailer_type: 'long haul', license_plate: 'TRLR1', make: 'jak', model: 'por', manufactured_year: '2005', vin_number: '132')
Trailer.create(trailer_no: '2', trailer_type: 'fridge', license_plate: 'TRLR2', make: 'lok', model: 'dur', manufactured_year: '2005', vin_number: '131')
Trailer.create(trailer_no: '3', trailer_type: 'long haul', license_plate: 'TRLR3', make: 'pic', model: 'zed', manufactured_year: '2005', vin_number: '121')
Trailer.create(trailer_no: '4', trailer_type: 'flat', license_plate: 'TRLR4', make: 'sid', model: 'dot', manufactured_year: '2005', vin_number: '122')
Trailer.create(trailer_no: '5', trailer_type: 'fridge', license_plate: 'TRLR5', make: 'lor', model: 'let', manufactured_year: '2005', vin_number: '123')

#Trips
Trip.create(truck_id: '1', trailer_id: '1', expense_id: '1', start_date: '20130702', end_date: '20130708', load_bar_count: '6', kilometres_accumulated: '2000') 
Trip.create(truck_id: '2', trailer_id: '2', expense_id: '2', start_date: '20130703', end_date: '20130709', load_bar_count: '6', kilometres_accumulated: '2000') 
Trip.create(truck_id: '3', trailer_id: '3', expense_id: '3', start_date: '20130702', end_date: '20130708', load_bar_count: '6', kilometres_accumulated: '2000') 
Trip.create(truck_id: '4', trailer_id: '4', expense_id: '4', start_date: '20130703', end_date: '20130709', load_bar_count: '6', kilometres_accumulated: '2000') 
Trip.create(truck_id: '5', trailer_id: '5', expense_id: '5', start_date: '20130702', end_date: '20130708', load_bar_count: '6', kilometres_accumulated: '2000')

#Trucks
Truck.create(truck_no: '1', truck_type: 'Reg', license_plate: 'TRUCK1', license_expires: '20140301', owner: '1', make: 'jig', model: 'lok', manufactured_year: '2005', vin_number: '123', total_kilometres: '500000', current_location: 'Yard')
Truck.create(truck_no: '2', truck_type: 'Reg', license_plate: 'TRUCK2', license_expires: '20140301', owner: '', make: 'ark', model: 'per', manufactured_year: '2005', vin_number: '321', total_kilometres: '550361', current_location: 'Yard')
Truck.create(truck_no: '3', truck_type: 'Reg', license_plate: 'TRUCK3', license_expires: '20140301', owner: '', make: 'pok', model: 'jid', manufactured_year: '2005', vin_number: '142', total_kilometres: '541250', current_location: 'Yard')
Truck.create(truck_no: '4', truck_type: 'Reg', license_plate: 'TRUCK4', license_expires: '20140301', owner: '', make: 'dit', model: 'lar', manufactured_year: '2005', vin_number: '124', total_kilometres: '561254', current_location: 'Yard')
Truck.create(truck_no: '5', truck_type: 'Reg', license_plate: 'TRUCK5', license_expires: '20140301', owner: '', make: 'tag', model: 'bet', manufactured_year: '2005', vin_number: '132', total_kilometres: '516952', current_location: 'Yard')
