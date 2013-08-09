class Truck < ActiveRecord::Base
  attr_accessible :license_expires, :license_plate, :make, :manufactured_year, :model, :owner, :total_kilometres, :truck_no, :truck_type, :vin_number, :current_location
  
  def self.search(keyword, column_name)
    if self.column_names.include?(column_name.to_s)
      where("trucks.#{column_name} LIKE ?", "%#{keyword}%")
    else
      scoped
    end
  end
  
  # This method will return the columns NOT IN the `unwanted_columns` array
  def self.searchable_columns
    unwanted_column = ['license_expires', 'id']
    self.column_names.reject{ |column| unwanted_column.include?(column) }
  end
  
  def self.translated_searchable_columns
    columns = self.searchable_columns
    result = columns.map{ |column| [Truck.human_attribute_name(column.to_sym), column] }
    result
  end
end
