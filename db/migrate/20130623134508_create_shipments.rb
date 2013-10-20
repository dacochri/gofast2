class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :shipment_no
      t.integer :broker_id
      t.integer :customer_id
      t.integer :trip_id
      t.integer :cartage_id
      t.decimal :rate
      t.boolean :partial
      t.integer :distance

      t.timestamps
    end
  end
end
