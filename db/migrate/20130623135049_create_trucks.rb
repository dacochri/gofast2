class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.integer :truck_no
      t.string :truck_type
      t.string :license_plate
      t.date :license_expires
      t.integer :owner
      t.string :make
      t.string :model
      t.integer :manufactured_year
      t.string :vin_number
      t.integer :total_kilometres
      t.string :current_location
      t.string :color

      t.timestamps
    end
  end
end
