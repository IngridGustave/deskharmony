require 'date'

class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:destroy]

  def create
    puts "--------------------------------------"
    puts "--------------------------------------"
     @date = Date.parse(params.fetch(:date, Date.today.to_s))
    @appointments_week = Appointment.where(user: current_user).where("DATE(start_at) >= ? AND DATE(start_at) <= ?", @date.all_week.begin, @date.all_week.end)
    appointment =  Appointment.new(appointment_params)
    desk = Desk.find_by(name: params[:appointment][:desk_id])

    appointment.desk_id = params[:appointment][:desk_id]
    appointment.user = current_user
    appointment.save



respond_to do |format|
    format.html
    format.text { render partial: "desks/week_calendar", locals: {appointments_week: @appointments_week}, formats: [:html] }
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
    puts params
   params.require(:appointment).permit(:start_at, :end_at, :desk_id)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

end
