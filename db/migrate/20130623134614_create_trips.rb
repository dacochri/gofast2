class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :truck_id
      t.integer :trailer_id
      t.integer :expense_id
      t.integer :driver_id
      t.integer :cartage_id
      t.date :start_date
      t.date :end_date
      t.integer :load_bar_count
      t.decimal :kilometres_accumulated

      t.timestamps
    end
  end
end
