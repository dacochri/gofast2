class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :quick_pay
      t.decimal :fuel
      t.decimal :driver_pay
      t.decimal :misc_cost

      t.timestamps
    end
  end
end
