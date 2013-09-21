class CreateSkids < ActiveRecord::Migration
  def change
    create_table :skids do |t|
      t.integer :shipment_id
      t.string :product_desc
      t.integer :skid_count
      t.decimal :weight
      t.string :unit
      t.boolean :oversized
      t.string :pickup_location
      t.string :delivery_location
      t.datetime :pickup_time
      t.datetime :delivery_time
      t.datetime :warehouse_pickup_time
      t.datetime :warehouse_delivery_time

      t.timestamps
    end
  end
end
