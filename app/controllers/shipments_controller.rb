class ShipmentsController < ApplicationController
  # If user is not logged in, redirect to login screen
  before_filter :authenticate_user!
  
  include ApplicationHelper
  
  # GET /shipments
  # GET /shipments.json
  def index
    # Page to show all records
    # Get shipments, order results, and paginate
    @shipments = Shipment.search(params[:search], params[:column]).order(sort_column(Shipment, 'broker_id') + ' ' + sort_direction).page(params[:page]).per(10)
    
    get_params()

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shipments }
    end
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
    # Page to show one record
    @shipment = Shipment.find(params[:id])
    # Since this table has many foreign keys, get the corresponding data from table
    @trip = Trip.find(@shipment.trip_id) rescue nil
    @broker = Company.find(@shipment.broker_id) rescue nil
    @shipper = Company.find(@shipment.shipper) rescue nil
    @receiver = Company.find(@shipment.receiver) rescue nil
    @primary_driver = Driver.find(@shipment.primary_driver) rescue nil
    @secondary_driver = Driver.find(@shipment.secondary_driver) rescue nil
    @skid = Skid.where(shipment_id: @shipment.id).first rescue nil

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shipment }
    end
  end

  # GET /shipments/new
  # GET /shipments/new.json
  def new
    # Form to create a new record
    @shipment = Shipment.new
    # Populate dropdown with data
    @trips = Trip.all
    @broker_companies = Company.where(:company_type => 'broker')
    @cartage_companies = Company.where(:company_type => 'cartage')
    @shipper_receiver = Company.where("company_type = 'customer' OR company_type = 'broker'")
    @drivers = Driver.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shipment }
    end
  end

  # GET /shipments/1/edit
  def edit
    # Form to edit a record
    @shipment = Shipment.find(params[:id])
    # Get data that will be populated in the dropdown lists
    @trips = Trip.all
    @broker_companies = Company.where(:company_type => 'broker')
    @cartage_companies = Company.where(:company_type => 'cartage')
    @shipper_receiver = Company.where("company_type = 'customer' OR company_type = 'broker'")
    @drivers = Driver.all
  end

  # POST /shipments
  # POST /shipments.json
  def create
    # Logic to create a new record
    @shipment = Shipment.new(params[:shipment])

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
        format.json { render json: @shipment, status: :created, location: @shipment }
      else
        format.html { render action: "new" }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shipments/1
  # PUT /shipments/1.json
  def update
    # Logic to update a record
    @shipment = Shipment.find(params[:id])

    respond_to do |format|
      if @shipment.update_attributes(params[:shipment])
        format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    # Logic to delete a record
    @shipment = Shipment.find(params[:id])
    @shipment.destroy

    respond_to do |format|
      format.html { redirect_to shipments_url }
      format.json { head :no_content }
    end
  end
end
