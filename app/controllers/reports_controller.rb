class ReportsController < ApplicationController
  include ApplicationHelper
  
  # GET /reports/trucks
  # GET /reports/trucks.json
  def trip_expenses
    sql_query = {
      'January' => { 'start' => Time.now.year.to_s + '-01-01', 'end' => Time.now.year.to_s + '-01-31' },
      'February' => { 'start' => Time.now.year.to_s + '-02-01', 'end' => Time.now.year.to_s + '-02-29' },
      'March' => { 'start' => Time.now.year.to_s + '-03-01', 'end' => Time.now.year.to_s + '-03-31' },
      'April' => { 'start' => Time.now.year.to_s + '-04-01', 'end' => Time.now.year.to_s + '-04-30' },
      'May' => { 'start' => Time.now.year.to_s + '-05-01', 'end' => Time.now.year.to_s + '-05-31' },
      'June' => { 'start' => Time.now.year.to_s + '-06-01', 'end' => Time.now.year.to_s + '-06-30' },
      'July' => { 'start' => Time.now.year.to_s + '-07-01', 'end' => Time.now.year.to_s + '-07-31' },
      'August' => { 'start' => Time.now.year.to_s + '-08-01', 'end' => Time.now.year.to_s + '-08-31' },
      'September' => { 'start' => Time.now.year.to_s + '-09-01', 'end' => Time.now.year.to_s + '-09-30' },
      'October' => { 'start' => Time.now.year.to_s + '-10-01', 'end' => Time.now.year.to_s + '-10-31' },
      'November' => { 'start' => Time.now.year.to_s + '-11-01', 'end' => Time.now.year.to_s + '-11-30' },
      'December' => { 'start' => Time.now.year.to_s + '-12-01', 'end' => Time.now.year.to_s + '-12-31' },
      '1st Quarter' => { 'start' => Time.now.year.to_s + '-01-01', 'end' => Time.now.year.to_s + '-03-31' },
      '2nd Quarter' => { 'start' => Time.now.year.to_s + '-04-01', 'end' => Time.now.year.to_s + '-06-30' },
      '3rd Quarter' => { 'start' => Time.now.year.to_s + '-07-01', 'end' => Time.now.year.to_s + '-09-30' },
      '4th Quarter' => { 'start' => Time.now.year.to_s + '-10-01', 'end' => Time.now.year.to_s + '-12-31' },
      'Current Year' => { 'start' => Time.now.year.to_s + '-01-01', 'end' => Time.now.year.to_s + '-12-31' },
      'Previous Year' => { 'start' => (Time.now.year.to_i - 1).to_s + '-01-01', 'end' => Time.now.year.to_s + '-12-31' },
      '2 Years Ago' => { 'start' => (Time.now.year.to_i - 2).to_s + '-01-01', 'end' => Time.now.year.to_s + '-12-31' }
    }
  
    unless params[:date].nil?
      @trips = Trip.where('start_date >= ? AND end_date <= ?', sql_query[params[:date]]['start'], sql_query[params[:date]]['end'])
    else
      start_date = Time.now.month.to_i
      start_date = Time.now.year.to_s + '-' + start_date.to_s + '-01'
      end_date = Time.now.month.to_i + 1
      end_date = Time.now.year.to_s + '-' + end_date.to_s + '-01'
      @trips = Trip.all
      @trips = Trip.where('start_date >= ? AND end_date <= ?', start_date, end_date)
    end
  end
  
  def ReportsController.trip_records(id)
    records = {
      'shipper_id' => Shipment.where("trip_id = ?", id).map(&:shipper),
      'shippment_id' => Shipment.where("trip_id = ?", id).map(&:id),
      'shippment_no' => Shipment.where("trip_id = ?", id).map(&:shipment_no),
      'shipper_name' => Array.new,
      'distance' => 0,
      'rate' => 0,
      'quick_pay' => 0,
      'fuel' => Trip.where("id = ?", id).select('fuel_cost').first.fuel_cost,
      'misc_cost' => Trip.where("id = ?", id).select('misc_cost').first.misc_cost,
      'driver_pay' => 0,
      'profit' => 0
    }
    
    total = records['fuel'].to_f + records['misc_cost'].to_f
    i = 0
    records['shipper_id'].each do |s|
      current_shippment = Shipment.find records['shippment_id'][i]
      current_company = Company.find s
      records['distance'] = records['distance'] + current_shippment.distance
      records['rate'] = records['rate'] + current_shippment.rate
      records['quick_pay'] = records['quick_pay'] + current_shippment.primary_quick_pay
      records['misc_cost'] = records['misc_cost'] + current_shippment.misc_cost
      #records['quick_pay'] = records['quick_pay'] + current_shippment.primary_quick_pay + current_shippment.secondary_quick_pay
      records['driver_pay'] = records['driver_pay'] + current_shippment.primary_driver_pay
      #records['driver_pay'] = records['driver_pay'] + current_shippment.primary_driver_pay + current_shippment.secondary_driver_pay
      records['profit'] = records['profit'].to_f + current_shippment.primary_quick_pay.to_f + current_shippment.rate.to_f - current_shippment.misc_cost.to_f - current_shippment.primary_driver_pay - total
      records['profit'] = records['profit'].to_f.round(2)
      records['shipper_name'].push current_company.name
      i = i + 1
    end
    return records
  end
  
  def trucks
    
    @trucks = Truck.search(params[:search], params[:column]).order(sort_column(Truck, 'truck_no') + ' ' + sort_direction).page(params[:page])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trucks }
    end
  end
  
  # GET /reports/announcements
  # GET /reports/announcements.json
  def announcements
  
    @announcements = Announcement.search(params[:search], params[:column]).order(sort_column(Announcement, 'date_posted') + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcements }
    end
  end
  
  # GET /reports/cartages
  # GET /reports/cartages.json
  def cartages
    params[:search] = format_date params[:search]
    
    @cartages = Cartage.search(params[:search], params[:column]).order(sort_column(Cartage, 'company_id') + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cartages }
    end
  end
  
  # GET /reports/companies
  # GET /reports/companies.json
  def companies
    @companies = Company.search(params[:search], params[:column]).order(sort_column(Company, 'company_type') + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end
  
  # GET /reports/drivers
  # GET /reports/drivers.json
  def drivers
    @drivers = Driver.search(params[:search], params[:column]).order(sort_column(Driver, 'first_name') + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drivers }
    end
  end
  
  # GET /reports/expenses
  # GET /reports/expenses.json
  def expenses
    @expenses = Expense.search(params[:search], params[:column]).order(sort_column(Expense, 'quick_pay') + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end
  
  # GET /reports/job_postings
  # GET /reports/job_postings.json
  def job_postings
    @job_postings = JobPosting.search(params[:search], params[:column]).order(sort_column(JobPosting, 'title') + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_postings }
    end
  end
  
  # GET /reports/maintenances
  # GET /reports/maintenances.json
  def maintenances
    @maintenances = Maintenance.search(params[:search], params[:column]).order(sort_column(Maintenance, 'vehicle_id') + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maintenances }
    end
  end
  
  def quotes
  
  end
  
  def schedule
  
  end
  
  # GET /reports/shipments
  # GET /reports/shipments.json
  def shipments
    @shipments = Shipment.search(params[:search], params[:column]).order(sort_column(Shipment, 'broker_id') + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shipments }
    end
  end
  
  # GET /reports/skids
  # GET /reports/skids.json
  def skids
    # Get all the records for skids. Order the values based on what its set to order by
    @skids = Skid.search(params[:search], params[:column]).order(sort_column(Skid, 'shipment_id') + ' ' + sort_direction).page(params[:page])
    
    # Either load an html page or json if the format is set to that
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skids }
    end
  end
  
  # GET /trailers
  # GET /trailers.json
  def trailers
    @trailers = Trailer.search(params[:search], params[:column]).order(sort_column(Trailer, 'trailer_no') + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trailers }
    end
  end
  
  # GET /trips
  # GET /trips.json
  def trips
    @trips = Trip.search(params[:search], params[:column]).order(sort_column(Trip, 'truck_id') + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end
  
  #def ReportsController.my_report(report_name)
    #case report_name
    #when "truck_count"
      #return ReportsController.truck_count()
    #when "Abc"
      #return "dsasdf"
    #else
      #return report_name
    #end
  #end
  
  #Random report test
  #def ReportsController.truck_count()
    #return Truck.count(:distinct => true)
  #end
end
