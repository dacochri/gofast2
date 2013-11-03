class JobApplicationsController < ApplicationController
  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = JobApplication.new(params[:job_application])
    #If the quote goes through, render the thank you page, else render the new application page
    if @job_application.deliver
      render :thank_you
    else
      render :new
    end
  end
end