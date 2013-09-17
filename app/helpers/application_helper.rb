module ApplicationHelper
  #This method will print out the headers in the table on the pages, it will make the sortable as well
	def sortable(column, title = nil, table, col)
    #Takes the name of the column and transforms it into a readable word i.e. my_column become My Column
	  title ||= column.titleize
    #Stores the value of the column by which it is sorting
	  data_sort = column == sort_column(table, col) ? sort_direction : nil
    #Stores the value of the direction of by which the column is being sorted by
    direction = column == sort_column(table, col) && sort_direction == 'asc' ? 'desc' : 'asc'
    #Prints out the column header as a click-able link which is used to sort the table
	  link_to title, params.merge(:sort => column, :direction => direction), :'data-sort' => data_sort
	end

  #Selects by which column to sort the page, if nothing is selected than it uses the default provided in the method argument
	def sort_column(table, col)
		table.column_names.include?(params[:sort]) ? params[:sort] : col
	end

  #Selects the sort direction for the filters, if nothing is assigned then it chooses ascending as default
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
	end
end
