class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :type
      t.string :name
      t.string :street
      t.string :unit
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :email
      t.integer :primary_phone
      t.integer :secondary_phone
      t.integer :fax
      t.string :contact_name

      t.timestamps
    end
  end
end
