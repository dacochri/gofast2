class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :truck_id
      t.integer :trailer_id
      t.date :start_date
      t.date :end_date
      t.decimal :driver_pay
      t.integer :load_bar_count
      t.decimal :lease
      t.decimal :insurance
      t.decimal :misc_cost
      t.decimal :kilometres_accumulated

      t.timestamps
    end
  end
end
