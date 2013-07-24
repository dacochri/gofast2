class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.integer :last_service_id
      t.integer :last_safety_id
      t.integer :truck_no
      t.string :truck_type
      t.string :license_plate
      t.date :license_expires
      t.boolean :owned
      t.string :make
      t.string :model
      t.integer :manufactured_year
      t.string :vin_number
      t.integer :next_service_kilometres
      t.date :next_safety_date
      t.integer :total_kilometres
      t.string :current_location

      t.timestamps
    end
  end
end
