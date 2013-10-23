class CartagesController < ApplicationController
  include ApplicationHelper
  
  # GET /cartages
  # GET /cartages.json
  def index
    params[:search] = format_date params[:search]
    
    @cartages = Cartage.search(params[:search], params[:column]).order(sort_column(Cartage, 'company_id') + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cartages }
    end
  end

  # GET /cartages/1
  # GET /cartages/1.json
  def show
    @cartage = Cartage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cartage }
    end
  end

  # GET /cartages/new
  # GET /cartages/new.json
  def new
    @cartage = Cartage.new
    @cartage_companies = Company.where(:company_type => 'cartage')
    @trailers = Trailer.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cartage }
    end
  end

  # GET /cartages/1/edit
  def edit
    @cartage = Cartage.find(params[:id])
  end

  # POST /cartages
  # POST /cartages.json
  def create
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
    @cartage = Cartage.find(params[:id])
    @cartage.destroy

    respond_to do |format|
      format.html { redirect_to cartages_url }
      format.json { head :no_content }
    end
  end
end
