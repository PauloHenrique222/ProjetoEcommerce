class Site::Profile::MyDataController < ApplicationController

  layout 'site'

  before_action :set_profile_member, only: [:edit, :update]

  def edit
  end

  def update
    if @profile_member.update(params_my_data)
      redirect_to edit_site_profile_my_datum_path(current_member.id), notice: "Update successfully"
    else
      render :edit
    end
  end

  private

  def set_profile_member
    @profile_member = ProfileMember.find_or_create_by(member_id: current_member.id)
  end

  def params_my_data
    params.require(:profile_member).permit(:first_name, :second_name, :birthdate)
  end

end
