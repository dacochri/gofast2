class TrailersController < ApplicationController
  # If not logged in, redirect user. Also restrict access from drivers
  before_filter :authenticate_user!, :redirect_driver
  
  include ApplicationHelper
  
  # GET /trailers
  # GET /trailers.json
  def index
    # Show all records
    params[:search] = format_date params[:search]
    
    @trailers = Trailer.search(params[:search], params[:column]).order(sort_column(Trailer, 'trailer_no') + ' ' + sort_direction).page(params[:page]).per(10)
    
    get_params()

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trailers }
    end
  end

  # GET /trailers/1
  # GET /trailers/1.json
  def show
    # Show one record
    @trailer = Trailer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trailer }
    end
  end

  # GET /trailers/new
  # GET /trailers/new.json
  def new
    # Form to create a new record
    @trailer = Trailer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trailer }
    end
  end

  # GET /trailers/1/edit
  def edit
    # Form to edit a record
    @trailer = Trailer.find(params[:id])
  end

  # POST /trailers
  # POST /trailers.json
  def create
    # Logic to create a new record
    @trailer = Trailer.new(params[:trailer])

    respond_to do |format|
      if @trailer.save
        format.html { redirect_to @trailer, notice: 'Trailer was successfully created.' }
        format.json { render json: @trailer, status: :created, location: @trailer }
      else
        format.html { render action: "new" }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trailers/1
  # PUT /trailers/1.json
  def update
    # Logic to update a record
    @trailer = Trailer.find(params[:id])

    respond_to do |format|
      if @trailer.update_attributes(params[:trailer])
        format.html { redirect_to @trailer, notice: 'Trailer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trailers/1
  # DELETE /trailers/1.json
  def destroy
    # Logic to delete a record
    @trailer = Trailer.find(params[:id])
    @trailer.destroy

    respond_to do |format|
      format.html { redirect_to trailers_url }
      format.json { head :no_content }
    end
  end
end
