class AppointmentsController < ApplicationController

  def create
    @desk =Desk.find(params[:id])
    @appointment = appointment.new
    @appointment.desk = @desk
    @appointment.user = 1
    if @appointment.save
      redirect_to desks_path
    else
      render "desks", status: :unprocessable_entity
    end


  end
end
