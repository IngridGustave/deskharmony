require 'date'

class DesksController < ApplicationController
  def index

    @desks = Desk.all
    @appointment = Appointment.new

    # génération des données pour l'envoyer au controller Stimulus au format json
    start_at = params[:startdate] if params[:startdate].present?
    end_at = params[:enddate] if params[:enddate].present?

    data = []

    @desks.each do |desk|
      #initialisation de l'heure actuelle
         current_time = Time.now
         time_rails = current_time.strftime("%Y-%m-%d %H:%M:%S UTC")
         time_rails_plus_une_heure = (current_time + 1.hour).strftime("%Y-%m-%d %H:%M:%S UTC")
        #récupération des paramètres, si il y en a
         if start_at
         date_start = Date.parse(start_at)
         date_end = Date.parse(end_at)
         #sinon récupération de l"heure en cours
        else
         date_start =  time_rails
         date_end = time_rails_plus_une_heure
        end
        # recherche des dispos
         booked = Appointment.where("(? < end_at) AND (? > start_at) AND desk_id = ?", date_start, date_end, desk.name).exists?

  # on remplit le tableau si il y a des créneaux ou non de trouvé
       if booked
        data << {id: desk.id, name: desk.name, level: desk.level, dispo: false}
       else
          data << {id: desk.id, name: desk.name, level: desk.level, dispo: true, start_at: start_at, end_at: end_at}
       end
    end



    # envoi des données au controller stimulus
     respond_to do |format|
      format.html
      format.json { render json: data }
    end
  end
end
