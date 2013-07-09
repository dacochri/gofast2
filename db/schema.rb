# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130623135402) do

  create_table "announcements", :force => true do |t|
    t.integer  "posted_by"
    t.string   "title"
    t.string   "content"
    t.datetime "date_posted"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cartages", :force => true do |t|
    t.integer  "company_id"
    t.integer  "trailer_id"
    t.integer  "shipment_id"
    t.datetime "pickup_time"
    t.datetime "delivery_time"
    t.string   "driver_name"
    t.decimal  "cost"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "street"
    t.string   "unit"
    t.string   "city"
    t.string   "privince"
    t.string   "postal_code"
    t.string   "email"
    t.integer  "primary_phone"
    t.integer  "secondary_phone"
    t.integer  "fax"
    t.string   "contact_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "drivers", :force => true do |t|
    t.integer  "truck_id"
    t.integer  "trailer_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "unit"
    t.string   "city"
    t.string   "postal_code"
    t.integer  "home_phone"
    t.integer  "cell_phone"
    t.string   "business_name"
    t.string   "hst_no"
    t.string   "comments"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "job_postings", :force => true do |t|
    t.string   "title"
    t.date     "post_date"
    t.date     "closing_date"
    t.string   "description"
    t.string   "requirements"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "maintenances", :force => true do |t|
    t.integer  "vehicle_id"
    t.integer  "trip_id"
    t.date     "date"
    t.decimal  "cost"
    t.string   "type"
    t.string   "description"
    t.integer  "kilometres"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "shipments", :force => true do |t|
    t.integer  "broker_id"
    t.integer  "driver_id"
    t.integer  "customer_id"
    t.integer  "trip_id"
    t.integer  "shipment_no"
    t.datetime "pickup_time"
    t.datetime "delivery_time"
    t.decimal  "rate"
    t.integer  "skid_count"
    t.boolean  "partial"
    t.decimal  "distance"
    t.boolean  "cartage"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "skids", :force => true do |t|
    t.integer  "shipment_id"
    t.integer  "company_id"
    t.string   "product_desc"
    t.decimal  "weight"
    t.boolean  "oversized"
    t.string   "pickup_location"
    t.string   "delivery_location"
    t.datetime "pickup_time"
    t.datetime "delivery_time"
    t.datetime "warehouse_delivery_time"
    t.datetime "warehouse_pickup_time"
    t.integer  "skid_count"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "trailers", :force => true do |t|
    t.integer  "last_service_id"
    t.integer  "last_safety_id"
    t.integer  "trailer_no"
    t.string   "type"
    t.string   "license_plate"
    t.string   "make"
    t.string   "model"
    t.integer  "manufactured_year"
    t.string   "vin_number"
    t.date     "next_service_date"
    t.date     "next_safety_date"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "trips", :force => true do |t|
    t.integer  "truck_id"
    t.integer  "trailer_id"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "driver_pay"
    t.integer  "load_bar_count"
    t.decimal  "lease"
    t.decimal  "insurance"
    t.decimal  "misc_cost"
    t.decimal  "kilometres_accumulated"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "trucks", :force => true do |t|
    t.integer  "last_service_id"
    t.integer  "last_safety_id"
    t.integer  "truck_no"
    t.string   "type"
    t.string   "license_plate"
    t.date     "license_expires"
    t.boolean  "owned"
    t.string   "make"
    t.string   "model"
    t.integer  "manufactured_year"
    t.string   "vin_number"
    t.integer  "next_service_kilometres"
    t.date     "next_safety_date"
    t.integer  "total_kilometres"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

end
