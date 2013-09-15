module ApplicationHelper
	def sortable(column, title = nil, table, col)
	  title ||= column.titleize
	  direction = column == sort_column(table, col) && sort_direction == 'asc' ? 'desc' : 'asc'
	  link_to title, params.merge(:sort => column, :direction => direction), :'data-sort' => direction
	end

	def sort_column(table, col)
		table.column_names.include?(params[:sort]) ? params[:sort] : col
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
	end
end
