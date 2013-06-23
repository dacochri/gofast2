class CreateCartages < ActiveRecord::Migration
  def change
    create_table :cartages do |t|
      t.integer :company_id
      t.integer :trailer_id
      t.integer :shipment_id
      t.datetime :pickup_time
      t.datetime :delivery_time
      t.string :driver_name
      t.decimal :cost

      t.timestamps
    end
  end
end
