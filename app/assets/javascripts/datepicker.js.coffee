# On page load
$ ->
  # Assign column to variable to reduce dom searching
  column = $('#column')
  # Acceptable fields for the datapicker to show up
  date_list = [
    'date_posted',
    'pickup_time',
    'delivery_time',
    'post_date',
    'closing_date',
    'date',
    'pickup_time',
    'delivery_time',
    'warehouse_delivery_time',
    'warehouse_pickup_time',
    'start_date',
    'end_date',
    'license_expires'
  ]
  
  # If the selected value matches date_list, add the datepicker
  date_assign = ->
    if $.inArray(column.val(), date_list) isnt -1
      $('#search').datepicker()
    else
      $('#search').datepicker 'destroy'
  
  # Add datepicker functionality on page load
  date_assign()
  
  # Add datepicker functionality when the dropdown value is changed
  column.on 'change', ->
    date_assign()
