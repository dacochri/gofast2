class ScheduleController < ApplicationController
  include ApplicationHelper
  
  def index
    @trucks = Truck.order(sort_column(Truck, 'truck_no') + ' ' + sort_direction)
  end
  
  def ScheduleController.schedule_record(id)
    current_date = Date.today
    no_records = false
    begin
      end_date = Trip.where("truck_id = ?", id).select('end_date').order('start_date DESC').first.end_date
    rescue
      no_records = true
    end
    current_schedule_record = {
        'truck_no' => Truck.where("id = ?", id).select('truck_no').first.truck_no,
        'current_mileage' => Truck.where("id = ?", id).select('total_kilometres').first.total_kilometres.to_s + ' km',
        'current_location' => Truck.where("id = ?", id).select('current_location').first.current_location,
        'post_all' => false
    }
    if no_records == false && current_date <= Trip.where("truck_id = ?", id).select('end_date').order('start_date DESC').first.end_date
      current_schedule_record['full_name'] = Driver.where("id = ?", Shipment.where("trip_id = ?", Trip.where("truck_id = ?", id).select('id').order('start_date DESC').first.id).select('primary_driver').first.primary_driver).select('name').first.name
      #current_schedule_record['last_name'] = Driver.where("id = ?", Shipment.where("trip_id = ?", Trip.where("truck_id = ?", id).select('id').order('start_date DESC').first.id).select('primary_driver').first.primary_driver).select('last_name').first.last_name
      current_schedule_record['driver_id'] = Shipment.where("trip_id = ?", Trip.where("truck_id = ?", id).select('id').order('start_date DESC').first.id).select('primary_driver').first.primary_driver
      current_schedule_record['trip_start'] = (Trip.where("truck_id = ?", id).select('start_date').order('start_date DESC').first.start_date).strftime('%Y-%m-%d')
      current_schedule_record['trip_no'] = Trip.where("truck_id = ?", id).select('id').order('start_date DESC').first.id
      current_schedule_record['load_bar_count'] = Trip.where("truck_id = ?", id).select('load_bar_count').order('start_date DESC').first.load_bar_count
      current_schedule_record['delivery_locations'] = Shipment.where("trip_id = ?", current_schedule_record['trip_no']).map(&:receiver_address)
      current_schedule_record['trailer_id'] = Trip.where("truck_id = ?", id).select('trailer_id').order('start_date DESC').first.trailer_id
      current_schedule_record['trailer_no'] = Trailer.where("id = ?", Trip.where("truck_id = ?", id).select('trailer_id').order('start_date DESC').first.trailer_id).select('trailer_no').first.trailer_no
      current_schedule_record['post_all'] = true
      
      shipments = Shipment.where("shipment_no = ", current_schedule_record['trip_no'])
      if Maintenance.where("vehicle_id = ? AND maintenance_type = ?", id, 'safety').count('date') > 0
        current_schedule_record['trailer_next_service_date'] = (Maintenance.where("vehicle_id = ? AND maintenance_type = ?", id, 'safety').select("date").order('kilometres DESC').first.date.to_time + 1.years).strftime('%Y-%m-%d')
      else
        current_schedule_record['trailer_next_service_date'] = 'No Records'
      end      
    end
    if Maintenance.where("vehicle_id = ? AND maintenance_type = ?", id, 'oil change').count('kilometres') > 0
      current_schedule_record['next_oil_change'] = (Maintenance.where("vehicle_id = ? AND maintenance_type = ?", id, 'oil change').select("kilometres").order('kilometres DESC').first.kilometres.to_i + 20000).to_s + ' km'
    else
      current_schedule_record['next_oil_change'] = 'No Records'
    end
    return current_schedule_record
  end
end
