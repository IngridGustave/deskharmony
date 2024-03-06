class DesksController < ApplicationController
  def index
    @desks = Desk.all
    @appointment = Appointment.new

    # génération des données pour l'envoyer au controller Stimulus au format json
    # simulation des disponibilités;
    data = []
    @desks.each do |desk|
      if rand < 0.3
       data << {id: desk.id, name: desk.name, level: desk.level , dispo: true}
      else
         data << {id: desk.id, name: desk.name, level: desk.level , dispo: false}
      end
    end
    puts data

     respond_to do |format|
      format.html
      format.json { render json: data }
    end
  end


end
