$ ->
  column = $('#search_column')
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
  
  date_assign = ->
    if $.inArray(column.val(), date_list) isnt -1
      $('#search').datepicker()
    else
      $('#search').datepicker 'destroy'
 
  date_assign()

  column.on 'change', ->
    date_assign()
