class AnnouncementsController < ApplicationController
  # redirect the user if they're not signed in, except on show action
  before_filter :authenticate_user!, :except => [:show]

  include ApplicationHelper
  
  # GET /announcements
  # GET /announcements.json
  def index
    # format the date to be usable
    params[:search] = format_date params[:search]
    
    # Get announcements, order it, and configure for pagination
    @announcements = Announcement.search(params[:search], params[:column]).order(sort_column(Announcement, 'date_posted') + ' ' + sort_direction).page(params[:page]).per(10)
    
    get_params()
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcements }
    end
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    # Shows a specific announcement based on the id in the url
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /announcements/new
  # GET /announcements/new.json
  def new
    # Renders the form to create a new announcement
    # If a logged in user that is a driver accesses this, redirect them
    redirect_driver

    @announcement = Announcement.new
    # Get the user associated with the announcement (user who posted the announcement)
    @user = User.where(id: current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /announcements/1/edit
  def edit
    # Renders the form to edit an announcement
    # If a logged in user that is a driver accesses this, redirect them
    redirect_driver
    
    @announcement = Announcement.new
    @user = User.where(id: current_user.id)
    
    @announcement = Announcement.find(params[:id])
  end

  # POST /announcements
  # POST /announcements.json
  def create
    # Takes the user input and submits it to the database.
    redirect_driver
    
    params[:announcement][:posted_by] = current_user.id
    params[:announcement][:date_posted] = Time.now
    @announcement = Announcement.new(params[:announcement])
    @user = User.where(id: current_user.id)
    
    # Redirect to Show page on success, or display error
    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
        format.json { render json: @announcement, status: :created, location: @announcement }
      else
        format.html { render action: "new" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /announcements/1
  # PUT /announcements/1.json
  def update
    # Takes the user input and updates the record
    redirect_driver
    
    @announcement = Announcement.find(params[:id])
    
    # Redirect to Show page on success, or display error
    respond_to do |format|
      if @announcement.update_attributes(params[:announcement])
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    # Delete a record based on the id supplied in url
    redirect_driver
    
    @announcement = Announcement.find(params[:id])
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to announcements_url }
      format.json { head :no_content }
    end
  end
end
