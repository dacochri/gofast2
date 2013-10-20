class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :unit
      t.string :city
      t.string :postal_code
      t.integer :home_phone
      t.integer :cell_phone
      t.string :drivers_license_number
      t.date :date_of_birth
      t.string :business_name
      t.string :comments

      t.timestamps
    end
  end
end
