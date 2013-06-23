class CreateSkids < ActiveRecord::Migration
  def change
    create_table :skids do |t|
      t.integer :shipment_id
      t.integer :company_id
      t.string :product_desc
      t.decimal :weight
      t.boolean :oversized
      t.string :pickup_location
      t.string :delivery_location
      t.datetime :pickup_time
      t.datetime :delivery_time
      t.datetime :warehouse_delivery_time
      t.datetime :warehouse_pickup_time
      t.integer :skid_count

      t.timestamps
    end
  end
end
