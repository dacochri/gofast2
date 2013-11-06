class DriversController < ApplicationController
  # Only valid users can access this page
  before_filter :authenticate_user!, :redirect_driver
  
  include ApplicationHelper
  
  # GET /drivers
  # GET /drivers.json
  def index
    # Show all records
    @drivers = Driver.search(params[:search], params[:column]).order(sort_column(Driver, 'name') + ' ' + sort_direction).page(params[:page]).per(10)
    
    get_params()

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drivers }
    end
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
    # Show one record
    @driver = Driver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @driver }
    end
  end

  # GET /drivers/new
  # GET /drivers/new.json
  def new
    # Form to create a new company
    @driver = Driver.new
    # Companies the driver might be associated with, populate drop down list
    @driver_companies = Company.where(:company_type => 'driver')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @driver }
    end
  end

  # GET /drivers/1/edit
  def edit
    # Edit specific record
    @driver = Driver.find(params[:id])
    # Companies the driver might be associated with, populate drop down list
    @driver_companies = Company.where(:company_type => 'driver')
  end

  # POST /drivers
  # POST /drivers.json
  def create
    # Logic to create a driver and submit to DB
    @driver = Driver.new(params[:driver])

    respond_to do |format|
      if @driver.save
        format.html { redirect_to @driver, notice: 'Driver was successfully created.' }
        format.json { render json: @driver, status: :created, location: @driver }
      else
        format.html { render action: "new" }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drivers/1
  # PUT /drivers/1.json
  def update
    # Logic to edit a driver and submit to DB
    @driver = Driver.find(params[:id])

    respond_to do |format|
      if @driver.update_attributes(params[:driver])
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    # Logic to delete a record
    @driver = Driver.find(params[:id])
    @driver.destroy

    respond_to do |format|
      format.html { redirect_to drivers_url }
      format.json { head :no_content }
    end
  end
end
