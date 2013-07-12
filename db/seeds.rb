# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Announcement.create(date_posted: '20130702', content: 'This is the body of the announcement', title: 'Intro Post', posted_by: '1')
Company.create(company_type: 'broker', name: 'Silvan Brokerage Inc.', street: '123 Anywhere Rd.', unit: '3B', city: 'Brampton', province: 'Ontario', postal_code: 'L9V 2K1', email: 'contact@silvanbrokerage.com', primary_phone: '18002663431', secondary_phone: '4169229898', fax: '4169222999', contact_name: 'John Bob')
