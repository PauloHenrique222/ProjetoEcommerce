class Site::HomeController < ApplicationController

  layout "site"

  def index
    @categories = Category.includes(:announcements).order(:description)
    @ads = Announcement.order(created_ad: :desc)
  end
end
