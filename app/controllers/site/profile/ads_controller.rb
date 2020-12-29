class Site::Profile::AdsController < ApplicationController

  layout 'site'
  before_action :set_ad, only: [:edit, :update]

  def index
    @ads = Announcement.where(member: current_member)
  end

  def edit

  end

  def update
    if @ad.update(params_ad)
      redirect_to site_profile_ads_path, notice: "Update successfully"
    else
      render :edit
    end
  end

  def new
    @ad = Announcement.new
  end

  def create
    @ad = Announcement.new(params_ad)
    @ad.member = current_member
    if @ad.save
      redirect_to site_profile_ads_path, notice: "Salve successfully"
    else
      render :new
    end
  end

  private

  def set_ad
    @ad = Announcement.find(params[:id])
  end

  def params_ad
    params.require(:announcement).permit(:title,
                                         :price, :category_id, :description, :finish_date)
  end
end
