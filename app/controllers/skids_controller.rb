class SkidsController < ApplicationController
  include ApplicationHelper
  
  # GET /skids
  # GET /skids.json
  # Index page, shows all records
  def index
    # Format date to correct format. ApplicationController.rb
    params[:search] = format_date params[:search]
    
    # Get all the records for skids. Order the values based on what its set to order by
    @skids = Skid.search(params[:search], params[:column]).order(sort_column(Skid, 'shipment_id') + ' ' + sort_direction)
    
    # Either load an html page or json if the format is set to that
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skids }
    end
  end

  # GET /skids/1
  # GET /skids/1.json
  # Show page, show one record based on supplied id
  def show
    # Search database and return the record with matching id
    @skid = Skid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skid }
    end
  end

  # GET /skids/new
  # GET /skids/new.json
  # New page, create a new record. This loads the form; it does NOT submit to the database
  def new
    @skid = Skid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skid }
    end
  end

  # GET /skids/1/edit
  # Edit page, edit a record. This loads the form; it does NOT submit to the database
  def edit
    @skid = Skid.find(params[:id])
  end

  # POST /skids
  # POST /skids.json
  # Create page, this submits the value from the form to the database to create a new record
  def create
    @skid = Skid.new(params[:skid])
    
    # Create record in the database, and return an appropriate message
    respond_to do |format|
      if @skid.save
        format.html { redirect_to @skid, notice: 'Skid was successfully created.' }
        format.json { render json: @skid, status: :created, location: @skid }
      else
        format.html { render action: "new" }
        format.json { render json: @skid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skids/1
  # PUT /skids/1.json
  # Update page, this submits the value from the form to the database to update the record
  def update
    @skid = Skid.find(params[:id])
    
    # Update record in the database; return appropraite message
    respond_to do |format|
      if @skid.update_attributes(params[:skid])
        format.html { redirect_to @skid, notice: 'Skid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skids/1
  # DELETE /skids/1.json
  # Destroy page, remove the specified record from the database
  def destroy
    @skid = Skid.find(params[:id])
    @skid.destroy

    respond_to do |format|
      format.html { redirect_to skids_url }
      format.json { head :no_content }
    end
  end
end
