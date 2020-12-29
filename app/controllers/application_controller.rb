class ApplicationController < ActionController::Base

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "devise_backoffice"
    elsif devise_controller? && resource_name == :member
      "devise_site"
    else
      "application"
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
