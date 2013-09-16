class ApplicationController < ActionController::Base
  protect_from_forgery

  def format_date(date)
    if date =~ /\d{2}\/\d{2}\/\d{4}/
      temp = date.split '/'
      date = "#{temp[2]}-#{temp[0]}-#{temp[1]}"
    end

    date
  end
end
