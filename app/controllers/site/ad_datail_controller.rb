class Site::AdDatailController < ApplicationController

  layout 'site'

  def show
    @ad = Announcement.find(params[:id])
  end
end
