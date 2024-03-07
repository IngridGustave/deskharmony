class AppointmentsController < ApplicationController

  def create
    appointment =  Appointment.new(appointment_params)
    appointment.user = current_user
    if appointment.save
      redirect_to desks_path
    else
      render "desks", status: :unprocessable_entity
    end
  end

  private

  def appointment_params
   params.require(:appointment).permit(:start_at, :end_at, :desk_id)
  end
end
