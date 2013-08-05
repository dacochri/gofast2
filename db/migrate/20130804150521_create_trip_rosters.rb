class CreateTripRosters < ActiveRecord::Migration
  def change
    create_table :trip_rosters do |t|
      t.integer :shipment_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
