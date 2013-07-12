class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.integer :last_service_id
      t.integer :last_safety_id
      t.integer :trailer_no
      t.string :trailer_type
      t.string :license_plate
      t.string :make
      t.string :model
      t.integer :manufactured_year
      t.string :vin_number
      t.date :next_service_date
      t.date :next_safety_date

      t.timestamps
    end
  end
end
