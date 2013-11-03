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

ActiveRecord::Schema.define(:version => 20131027143857) do

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
    t.datetime "pickup_time"
    t.datetime "delivery_time"
    t.string   "driver_name"
    t.decimal  "cost"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "company_type"
    t.string   "name"
    t.string   "street"
    t.string   "unit"
    t.string   "city"
    t.string   "province"
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
    t.string   "name"
    t.string   "street"
    t.string   "unit"
    t.string   "city"
    t.string   "postal_code"
    t.integer  "home_phone"
    t.integer  "cell_phone"
    t.string   "drivers_license_number"
    t.date     "date_of_birth"
    t.integer  "business_name"
    t.string   "comments"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
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
    t.string   "maintenance_type"
    t.string   "description"
    t.integer  "kilometres"
    t.string   "vehicle_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "shipments", :force => true do |t|
    t.integer  "shipment_no"
    t.integer  "trip_id"
    t.integer  "broker_id"
    t.integer  "shipper"
    t.integer  "receiver"
    t.integer  "cartage_id"
    t.date     "broker_date"
    t.string   "shipper_address"
    t.string   "receiver_address"
    t.decimal  "rate"
    t.boolean  "delivered"
    t.integer  "invoice"
    t.integer  "distance"
    t.integer  "primary_driver"
    t.integer  "secondary_driver"
    t.decimal  "primary_quick_pay"
    t.decimal  "secondary_quick_pay"
    t.decimal  "primary_driver_pay"
    t.decimal  "secondary_driver_pay"
    t.decimal  "misc_cost"
    t.string   "comments"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "skids", :force => true do |t|
    t.integer  "shipment_id"
    t.string   "product_desc"
    t.integer  "skid_count"
    t.decimal  "weight"
    t.string   "unit"
    t.boolean  "oversized"
    t.string   "pickup_location"
    t.string   "delivery_location"
    t.datetime "pickup_time"
    t.datetime "delivery_time"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "trailers", :force => true do |t|
    t.integer  "trailer_no"
    t.string   "trailer_type"
    t.string   "license_plate"
    t.string   "make"
    t.string   "model"
    t.integer  "manufactured_year"
    t.string   "vin"
    t.string   "location"
    t.string   "color"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "trips", :force => true do |t|
    t.integer  "truck_id"
    t.integer  "trailer_id"
    t.integer  "trip_no"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "load_bar_count"
    t.integer  "accumulated_kilometres"
    t.decimal  "fuel_cost"
    t.decimal  "misc_cost"
    t.string   "comments"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "trucks", :force => true do |t|
    t.integer  "truck_no"
    t.string   "truck_type"
    t.string   "license_plate"
    t.date     "license_expires"
    t.integer  "owner"
    t.string   "make"
    t.string   "model"
    t.integer  "manufactured_year"
    t.string   "vin"
    t.integer  "total_kilometres"
    t.string   "current_location"
    t.string   "color"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "access"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
