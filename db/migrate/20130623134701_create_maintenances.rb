class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.integer :vehicle_id
      t.integer :trip_id
      t.date :date
      t.decimal :cost
      t.string :maintenance_type
      t.string :description
      t.decimal :kilometres
      t.string :vehicle_type

      t.timestamps
    end
  end
end
