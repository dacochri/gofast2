class CartagesController < ApplicationController
  # Only logged in users can access the page
  before_filter :authenticate_user!
  
  # Allows helper methods to be used
  include ApplicationHelper
  
  # GET /cartages
  # GET /cartages.json
  def index
    # Change the format of the date supplied through search
    params[:search] = format_date params[:search]
    
    # Search for all cartage records, order them, and restrict it to 10 records per page
    @cartages = Cartage.search(params[:search], params[:column]).order(sort_column(Cartage, 'company_id') + ' ' + sort_direction).page(params[:page]).per(10)

    get_params()
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cartages }
    end
  end

  # GET /cartages/1
  # GET /cartages/1.json
  def show
    # Shows a specific record
    @cartage = Cartage.find(params[:id])
    # Used to turn foreign keys into human readable data (company name, etc)
    @company = Company.find(@cartage.company_id) rescue nil
    @trailer = Trailer.find(@cartage.trailer_id) rescue nil

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cartage }
    end
  end

  # GET /cartages/new
  # GET /cartages/new.json
  def new
    # Form to createa a new record
    @cartage = Cartage.new
    # Used to populate the drop down lists
    @cartage_companies = Company.where(:company_type => 'cartage')
    @trailers = Trailer.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cartage }
    end
  end

  # GET /cartages/1/edit
  def edit
    # Form to edit a specific record
    @cartage = Cartage.find(params[:id])
    # Used to populate the drop down lists
    @cartage_companies = Company.where(:company_type => 'cartage')
    @trailers = Trailer.all
  end

  # POST /cartages
  # POST /cartages.json
  def create
    # Logic to create a record and submit it to the database
    @cartage = Cartage.new(params[:cartage])

    respond_to do |format|
      if @cartage.save
        format.html { redirect_to @cartage, notice: 'Cartage was successfully created.' }
        format.json { render json: @cartage, status: :created, location: @cartage }
      else
        format.html { render action: "new" }
        format.json { render json: @cartage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cartages/1
  # PUT /cartages/1.json
  def update
    # Logic to edit a record and submit it to the database
    @cartage = Cartage.find(params[:id])

    respond_to do |format|
      if @cartage.update_attributes(params[:cartage])
        format.html { redirect_to @cartage, notice: 'Cartage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cartage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cartages/1
  # DELETE /cartages/1.json
  def destroy
    # Logic to delete a record based on the id supplied
    @cartage = Cartage.find(params[:id])
    @cartage.destroy

    respond_to do |format|
      format.html { redirect_to cartages_url }
      format.json { head :no_content }
    end
  end
end
