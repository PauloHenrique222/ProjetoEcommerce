class Backoffice::SendMailController < ApplicationController

  def edit
    @admin = Admin.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    begin
      AdminMailer.send_email(current_admin, params[:'recipient-name'],
                           params[:'subject-text'], params[:'message-text']).deliver_now
      @notify_message = "Email successfully sent"
      @notify_flag ="success"
    rescue
      @notify_message = "Error sending the email"
      @notify_flag="error"
    end
    respond_to do |format|
      format.js
    end
  end
end
