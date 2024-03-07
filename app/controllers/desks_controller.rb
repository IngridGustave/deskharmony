require 'date'

class DesksController < ApplicationController
  def index

    @desks = Desk.all
    @appointment = Appointment.new

    # génération des données pour l'envoyer au controller Stimulus au format json
    start_at = params[:startdate] if params[:startdate].present?
    end_at = params[:enddate] if params[:enddate].present?
    puts"--------------"
    puts start_at
    data = []

    @desks.each do |desk|

       if start_at
         date_start = Date.parse(start_at)
         date_end = Date.parse(end_at)
         booked = Appointment.where( "start_at > ? AND end_at < ?", date_start, date_end ).exists?
         puts booked
       end

       if booked
        data << {id: desk.id, name: desk.name, level: desk.level, dispo: false}
       else
          data << {id: desk.id, name: desk.name, level: desk.level, dispo: true, start_at: start_at, end_at: end_at}
       end
    end
    puts"mes données----------------------------------------------"
puts data
 puts"mes données----------------------------------------------"
    # envoi des données au controller stimulus
     respond_to do |format|
      format.html
      format.json { render json: data }
    end
  end


end
