class Site::AdDatailController < ApplicationController

  layout 'site'

  def show
    @ad = Announcement.includes(:comments, :member, member: :profile_member).find(params[:id])
    @categories = Category.order(:description)
  end
end
