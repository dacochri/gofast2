module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def search(keyword, column_name)
      if column_names.include?(column_name.to_s)
        where("#{table_name}.#{column_name} LIKE ?", "%#{keyword}%")
      else
        scoped
      end
    end

    def searchable_columns(unwanted_columns)
      column_names.reject{ |column| unwanted_columns.include?(column) }
    end

    def translated_searchable_columns(unwanted_columns)
      columns = searchable_columns(unwanted_columns)
      columns.map{ |column| [human_attribute_name(column.to_sym), column] }
    end
  end
end