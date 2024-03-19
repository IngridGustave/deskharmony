class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:destroy]

  def create

    appointment =  Appointment.new(appointment_params)
    desk = Desk.find_by(name: params[:appointment][:desk_id])
    puts '-----------------------'
    puts desk
    puts '-----------------------'
    appointment.desk = desk
    appointment.user = current_user
    if appointment.save
      redirect_to desks_path
    else
      # a remanier pour gérer les cas particuliers
      render "desks", status: :unprocessable_entity
    end
  end

  def index
    @appointments = Appointment.where(user: current_user)
  end

  def show
    @appointment = Appointment.find(params[:id])
    @level = Level.find_by(name: @appointment.desk.level)
    @levelSvg = @level.svg
  end


  def destroy
    if @appointment.destroy
      redirect_to appointments_path
    else
      render :index, status: :unprocessable_entity
    end
  end


  private

  def appointment_params
   params.require(:appointment).permit(:start_at, :end_at, :desk_id)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

end
