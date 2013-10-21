class IndexController < ApplicationController
  def index
    @announcements = Announcement.limit(6).order('id DESC').all
  end

  def about
    
  end

  def contact
    
  end
end
