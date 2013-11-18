class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :role
      t.string :controller
      t.string :permission

      t.timestamps
    end
  end
end
