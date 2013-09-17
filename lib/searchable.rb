module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    #This method is used to search for the value inside the database
    def search(keyword, column_name)
      #checks if the column selected exists in the database
      if column_names.include?(column_name.to_s)
        #Performs a Search Query on the table based on the user input
        where("#{table_name}.#{column_name} LIKE ?", "%#{keyword}%")
      else
        #if the column did not exist, it returns all records
        scoped
      end
    end
    #Loops through string array provided and removes those columns from the list.
    def searchable_columns(unwanted_columns)
      column_names.reject{ |column| unwanted_columns.include?(column) }
    end
    #Returns a map of columns that are able to be searched, this shows in the drop down on each page
    def translated_searchable_columns(unwanted_columns)
			unwanted_columns.push('created_at')
			unwanted_columns.push('updated_at')
      #Calls the method that removes the unwanted columns
      columns = searchable_columns(unwanted_columns)
      #Maps the columns and returns it as a hash
      columns.map{ |column| [human_attribute_name(column.to_sym), column] }
    end
  end
end