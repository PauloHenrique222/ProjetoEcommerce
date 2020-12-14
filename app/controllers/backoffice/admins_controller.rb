class Backoffice::AdminsController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_admin, only: [:edit, :update, :destroy]

  layout "backoffice"

  def pundit_user
    current_admin
  end

  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "Salve successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path, notice: "Update successfully"
    else
      render :edit
    end
  end

  def destroy
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "Delete successfully"
    else
      render :index
    end
  end

  private

  def params_admin
    params.require(:admin).permit(policy(@admin).permitted_attributes)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

end
