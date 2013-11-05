class ApplicationController < ActionController::Base
  protect_from_forgery
 
  helper_method :format_time

  # Since the date format the calendar input to MM-DD-YYYY, we want to change it to YYYY-MM-DD
  def format_date(date)
    # Only attempt to change the format if it matches a date format beforehand
    if date =~ /\d{2}\/\d{2}\/\d{4}/
      temp = date.split '/'
      date = "#{temp[2]}-#{temp[0]}-#{temp[1]}"
    end
    
    # Either return the value that was passed in (if a date wasn't passed in), or the newly changed format
    date
  end

  def format_time(date_time)
    date_time.strftime('%Y-%m-%d %H:%M %Z')
  end

  def redirect_not_admin
    unless current_user.access == 'admin'
      flash[:notice] = 'You cannot access that page.'
      redirect_to '/' 
    end
  end

  def redirect_driver
    if current_user.access == 'driver'
      flash[:notice] = 'You cannot access that page.'
      redirect_to '/' 
    end
  end
  
  def get_params
    @search = params[:search]
    @column = params[:column]
    @direction = params[:direction]
    @sort = params[:sort]
  end
end
