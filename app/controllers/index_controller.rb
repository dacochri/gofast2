class IndexController < ApplicationController
  def index
    # Show announcements on home page
    @announcements = Announcement.limit(6).order('id DESC').all
  end
  
  # Empty to allow navigation to that url
  def about
    
  end

  def contact
    
  end
end
