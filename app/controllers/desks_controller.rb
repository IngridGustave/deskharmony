class DesksController < ApplicationController
  def index

    @desks = Desk.all
    @appointment = Appointment.new

    # génération des données pour l'envoyer au controller Stimulus au format json
    # simulation des disponibilités;
    data = []

    if params["/desks"].present?
  start_at = params["/desks"][:start_at]
  end_at = params["/desks"][:end_at]
      puts"----------------------"
      puts ' ok donnees'
    end

    @desks.each do |desk|
       if   start_at && end_at
         available = Appointment.where( "start_at > ? AND end_at < ?", start_at, end_at)
         puts available
       end
       if !available
        data << {id: desk.id, name: desk.name, level: desk.level, dispo: true}
       else
          data << {id: desk.id, name: desk.name, level: desk.level, dispo: false}
       end


    end


     respond_to do |format|
      format.html
      format.json { render json: data }
    end
  end


end
