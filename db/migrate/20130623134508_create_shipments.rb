class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :shipment_no
      t.integer :trip_id
      t.integer :broker_id
      t.integer :shipper
      t.integer :receiver
      t.integer :cartage_id
      t.date :broker_date
      t.string :shipper_address
      t.string :receiver_address
      t.decimal :rate
      t.boolean :delivered
      t.integer :invoice
      t.integer :distance
      t.integer :primary_driver
      t.integer :secondary_driver
      t.decimal :primary_quick_pay
      t.decimal :secondary_quick_pay
      t.decimal :primary_driver_pay
      t.decimal :secondary_driver_pay
      t.decimal :misc_cost
      t.string :comments

      t.timestamps
    end
  end
end
