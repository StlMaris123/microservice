class NotificationsController < ApplicationController
  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      render json: @notification, status: :created
    else
      render json: @notification.errors, status: :unprocessable_entity
      #do something
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:body, :phone, :source_app)

  end

end
