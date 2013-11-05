class ShipmentsController < ApplicationController
  before_filter :authenticate_user!
  
  include ApplicationHelper
  
  # GET /shipments
  # GET /shipments.json
  def index
    @shipments = Shipment.search(params[:search], params[:column]).order(sort_column(Shipment, 'broker_id') + ' ' + sort_direction).page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shipments }
    end
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
    @shipment = Shipment.find(params[:id])
    @trip = Trip.find(@shipment.trip_id)
    @broker = Company.find(@shipment.broker_id)
    @shipper = Company.find(@shipment.shipper)
    @receiver = Company.find(@shipment.receiver)
    @primary_driver = Driver.find(@shipment.primary_driver)
    @secondary_driver = Driver.find(@shipment.secondary_driver)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shipment }
    end
  end

  # GET /shipments/new
  # GET /shipments/new.json
  def new
    @shipment = Shipment.new
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
    @shipment = Shipment.find(params[:id])
    @trips = Trip.all
    @broker_companies = Company.where(:company_type => 'broker')
    @cartage_companies = Company.where(:company_type => 'cartage')
    @shipper_receiver = Company.where("company_type = 'customer' OR company_type = 'broker'")
    @drivers = Driver.all
  end

  # POST /shipments
  # POST /shipments.json
  def create
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
    @shipment = Shipment.find(params[:id])
    @shipment.destroy

    respond_to do |format|
      format.html { redirect_to shipments_url }
      format.json { head :no_content }
    end
  end
end
