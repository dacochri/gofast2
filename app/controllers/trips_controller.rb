class TripsController < ApplicationController
  before_filter :authenticate_user!
  
  include ApplicationHelper
  
  # GET /trips
  # GET /trips.json
  def index
    params[:search] = format_date params[:search]
		
    @trips = Trip.search(params[:search], params[:column]).order(sort_column(Trip, 'truck_id') + ' ' + sort_direction).page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])
    @truck = Truck.find(@trip.truck_id)
    @trailer = Trailer.find(@trip.trailer_id)
    @shipment = Shipment.where(trip_id: @trip.id).first
    @primary_driver = Driver.find(@shipment.primary_driver)
    @secondary_driver = Driver.find(@shipment.secondary_driver)

    @profit = 0
    Shipment.where(trip_id: @trip.id).each do |s|
      @profit += s.rate
      @profit -= s.primary_driver_pay
      @profit -= s.secondary_driver_pay
      @profit += s.primary_quick_pay
      @profit += s.secondary_quick_pay
      @profit -= s.misc_cost
    end
    @profit -= @trip.fuel_cost
    @profit -= @trip.misc_cost

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new
    @trucks = Truck.all
    @trailers = Trailer.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
    @trucks = Truck.all
    @trailers = Trailer.all
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(params[:trip])

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end
