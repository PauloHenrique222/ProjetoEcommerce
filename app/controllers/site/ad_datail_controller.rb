class Site::AdDatailController < ApplicationController

  layout 'site'

  def show
    @ad = Announcement.find(params[:id])
    @categories = Category.order(:description)
  end
end
