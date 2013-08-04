class ScheduleController < ApplicationController
  def index
    @trucks = Truck.all
    @drivers = Driver.all
    
    #@truck = Truck.all.where(:registered => true)
    #@truck = Truck.all.where('registered = true')
    #l = Location.where(['id = ?', id]).select('name, website, city').first
    
  end
  
  def ScheduleController.schedule_record(id)
    current_schedule_record = {
      'truck_no' => Truck.where("id = ?", id).select('truck_no').first.truck_no,
	  'driver_name' => Driver.where("truck_id = ?", id).select('first_name').first.first_name,
	  #'driver_id' => Driver.where("truck_id = ?", id).select('id').first.id,
	  #'trip_no' => Trip.where("truck_id = ?", id).select('id').order('start_date DESC').first.id,
	  #'load_bar_count' => Trip.where("truck_id = ?", id).select('load_bar_count').order('start_date DESC').first.load_bar_count,
	  #'current_mileage' => Truck.where("id = ?", id).select('total_kilometres').first.total_kilometres,
	  #'next_oil_change' => Maintenance.where("vehicle_id = ? AND maintenance_type = ?", id, 'service').select("kilometres").order('kilometres DESC').first.kilometres,
	  #'current_location' => Truck.where("id = ?", id).select('current_location').first.current_location,
	  #'delivery_locations' => Skid.where("shipment_id = ?", 1).map(&:delivery_location),
	  #'trailer_no' => Trailer.where('id = ?', Trip.where("id = ?", Trip.where("truck_id = ?", id).select('id').order('start_date DESC').first.id).select('trailer_id').first.trailer_id).select('trailer_no').first.trailer_no,
	  #'trailer_next_service_date' => Maintenance.where("vehicle_id = ? AND maintenance_type = ?", id, 'service').select("date").order('kilometres DESC').first.date.to_time + 1.years
    }
	
	return current_schedule_record
  end
end
