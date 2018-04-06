class NotificationsController < ApplicationController
  include SmsTool
  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      SmsTool.send_sms("12345678", "check", "My APP")
      render json: @notification, status: :created
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
    # @notification = Notification.new(notification_params)
    # respond_to do |format|
    #   if @notification.save
    #     format.json { render action: 'show', status: :created, location: @notification }
    #   else
    #     format.json { render json: @notification.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

  def notification_params
    params.require(:notification).permit(:body, :phone, :source_app)
  end

end
