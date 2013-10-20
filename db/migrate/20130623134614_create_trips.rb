class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :truck_id
      t.integer :trailer_id
      t.date :start_date
      t.date :end_date
      t.integer :load_bar_count
      t.integer :accumulated_kilometres
      t.decimal :fuel_cost
      t.decimal :misc_cost
      t.string :comments

      t.timestamps
    end
  end
end
