class Site::SearchController < ApplicationController

  layout 'site'

  def ads
    @categories = Category.includes(:announcements).order(:description)
    @ads = Announcement.where("title LIKE '%#{params[:q]}%'")
  end

end
