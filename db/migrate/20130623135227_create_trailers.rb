class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.integer :trailer_no
      t.string :trailer_type
      t.string :license_plate
      t.string :make
      t.string :model
      t.integer :manufactured_year
      t.string :vin_number

      t.timestamps
    end
  end
end
