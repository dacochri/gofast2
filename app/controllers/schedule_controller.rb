class ScheduleController < ApplicationController
  def index
    @trucks = Truck.all
    @drivers = Driver.all
  end
  
  def ScheduleController.schedule_record(id)
    current_schedule_record = {
    'truck_no' => Truck.where("id = ?", id).select('truck_no').first.truck_no,
	'driver_name' => Driver.where("id = ?", Trip.where("id = ?", id).select('driver_id').first.driver_id).select('first_name').first.first_name + ' ' + Driver.where("id = ?", Trip.where("id = ?", id).select('driver_id').first.driver_id).select('last_name').first.last_name,
	'trip_no' => Trip.where("truck_id = ?", id).select('id').order('start_date DESC').first.id,
	'trip_start' => (Trip.where("truck_id = ?", id).select('start_date').order('start_date DESC').first.start_date).strftime('%Y-%m-%d'),
	'load_bar_count' => Trip.where("truck_id = ?", id).select('load_bar_count').order('start_date DESC').first.load_bar_count,
	'current_mileage' => Truck.where("id = ?", id).select('total_kilometres').first.total_kilometres.to_s + ' km',
    'current_location' => Truck.where("id = ?", id).select('current_location').first.current_location,
	'delivery_locations' => Skid.where("shipment_id = ?", 1).map(&:delivery_location),
	'trailer_no' => Trailer.where('id = ?', Trip.where("id = ?", Trip.where("truck_id = ?", id).select('id').order('start_date DESC').first.id).select('trailer_id').first.trailer_id).select('trailer_no').first.trailer_no
    }
    
    if Maintenance.where("vehicle_id = ? AND maintenance_type = ?", id, 'oil change').count("kilometres") > 0
		current_schedule_record['next_oil_change'] = (Maintenance.where("vehicle_id = ? AND maintenance_type = ?", id, 'oil change').select("kilometres").order('kilometres DESC').first.kilometres.to_i + 20000).to_s + ' km'
	else
		current_schedule_record['next_oil_change'] = 'No Records'
	end
	
	if Maintenance.where("vehicle_id = ? AND maintenance_type = ?", id, 'safety').count("date") > 0
		current_schedule_record['trailer_next_service_date'] = (Maintenance.where("vehicle_id = ? AND maintenance_type = ?", id, 'safety').select("date").order('kilometres DESC').first.date.to_time + 1.years).strftime('%Y-%m-%d')
	else
		current_schedule_record['trailer_next_service_date'] = 'No Records'
	end
	return current_schedule_record
  end
end
