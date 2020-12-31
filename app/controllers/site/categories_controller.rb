class Site::CategoriesController < ApplicationController

  layout 'site'

  def show
    @categories = Category.includes(:announcements).order(:description)
    @category = Category.friendly.find(params[:id])
    @ads = Announcement.where(category_id: @category.id)
  end

end
