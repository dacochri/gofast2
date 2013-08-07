class SkidsController < ApplicationController
  # GET /skids
  # GET /skids.json
  helper_method :sort_column, :sort_direction
  def index
    @skids = Skid.order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skids }
    end
  end

  # GET /skids/1
  # GET /skids/1.json
  def show
    @skid = Skid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skid }
    end
  end

  # GET /skids/new
  # GET /skids/new.json
  def new
    @skid = Skid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skid }
    end
  end

  # GET /skids/1/edit
  def edit
    @skid = Skid.find(params[:id])
  end

  # POST /skids
  # POST /skids.json
  def create
    @skid = Skid.new(params[:skid])

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
  def update
    @skid = Skid.find(params[:id])

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
  def destroy
    @skid = Skid.find(params[:id])
    @skid.destroy

    respond_to do |format|
      format.html { redirect_to skids_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def sort_column
    Skid.column_names.include?(params[:sort]) ? params[:sort] : "shipment_id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
