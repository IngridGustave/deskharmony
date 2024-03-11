require 'date'

class DesksController < ApplicationController
  def index

    @desks = Desk.all
    @appointment = Appointment.new
    @appointments_week = Appointment.where("DATE(start_at) >= ? AND DATE(start_at) <= ?", Date.today.all_week.begin, Date.today.all_week.end)

    # génération des données pour l'envoyer au controller Stimulus au format json
    start_at = params[:startdate] if params[:startdate].present?
    end_at = params[:enddate] if params[:enddate].present?
    if params[:level].present?
      puts params[:level]
       level =  params[:level]
       @levelSvg = Level.find_by(name: level)
       puts @levelSvg
       @levelSvg = @levelSvg.svg
       puts @levelSvg
    end

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
         desk_id = Desk.where(name: desk.name)
         desk_id = desk_id[(level.to_i - 1) || 0];
         #desk_id=Desk.joins(:levels).find_by(desks: { name: desk.name }, levels: { name: level || 1 }).id
         booked = Appointment.where("(? < end_at) AND (? > start_at) AND desk_id = ?", date_start, date_end, desk_id).exists?

  # on remplit le tableau si il y a des créneaux ou non de trouvé
       if booked
        data << {id: desk.id, name: desk.name, level: desk.level, dispo: false}
       else
          data << {id: desk.id, name: desk.name, level: desk.level, dispo: true}
       end
    end
    puts data



    # envoi des données au controller stimulus
     respond_to do |format|
      format.html
      format.json { render json: data }
      format.text { render partial: "desks/svg", locals: {levelSvg: @levelSvg}, formats: [:html] }

    end
  end
end
