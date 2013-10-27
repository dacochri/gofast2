class TrucksController < ApplicationController
  before_filter :authenticate_user!
  
  include ApplicationHelper
  
  # GET /trucks
  # GET /trucks.json
  def index
    # format date
    params[:search] = format_date params[:search]
    
    # get all trucks; order them; paginate
    @trucks = Truck.search(params[:search], params[:column]).order(sort_column(Truck, 'truck_no') + ' ' + sort_direction).page(params[:page]).per(3)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trucks }
    end
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
    # find truck by id
    @truck = Truck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @truck }
    end
  end

  # GET /trucks/new
  # GET /trucks/new.json
  def new
    # new form for truck
    @truck = Truck.new
    @driver_companies = Company.where(:company_type => 'driver')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @truck }
    end
  end

  # GET /trucks/1/edit
  def edit
    # edit form for truck
    @truck = Truck.find(params[:id])
  end

  # POST /trucks
  # POST /trucks.json
  def create
    # create a new truck in database
    @truck = Truck.new(params[:truck])

    respond_to do |format|
      if @truck.save
        format.html { redirect_to @truck, notice: 'Truck was successfully created.' }
        format.json { render json: @truck, status: :created, location: @truck }
      else
        format.html { render action: "new" }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trucks/1
  # PUT /trucks/1.json
  def update
    # update an existing truck in database
    @truck = Truck.find(params[:id])

    respond_to do |format|
      if @truck.update_attributes(params[:truck])
        format.html { redirect_to @truck, notice: 'Truck was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    # remove a truck from the database
    @truck = Truck.find(params[:id])
    @truck.destroy

    respond_to do |format|
      format.html { redirect_to trucks_url }
      format.json { head :no_content }
    end
  end
end
