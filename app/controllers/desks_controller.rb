require 'date'

class DesksController < ApplicationController

  def index
    @desks = Desk.all
    @appointment = Appointment.new
    @chatroom = Chatroom.find(1)
    @message = Message.new

# variable calendrier + recherche calendrier
    @start_of_last_week = Date.today.prev_week.beginning_of_week
    @end_of_last_week = Date.today.prev_week.end_of_week
    @last_week_dates = @start_of_last_week..@end_of_last_week
    @date = Date.parse(params.fetch(:date, Date.today.to_s))
    @appointments_week = Appointment.where(user: current_user).where("DATE(start_at) >= ? AND DATE(start_at) <= ?", @date.all_week.begin, @date.all_week.end)
# ------------------------
# génération des données pour l'envoyer au controller Stimulus au format json
    data = []
    start_at = params[:startdate] if params[:startdate].present?
    level = params[:level] if params[:level].present?
    @levelSvg = loadingSvglevel || 1
    data = generateJsonDesk(@desks, start_at, level)

# envoi des données au controller stimulus
    respond_to do |format|
      format.html
      format.json { render json: data }
      format.json { render json: @date }
      format.text { render partial: "desks/svg", locals: {levelSvg: @levelSvg}, formats: [:html] }
    end
  end

  def show
    @desk = Desk.find(params[:id])
    @appointment = Appointment.new
    @appointment_comings = Appointment.where("desk_id = ? AND start_at >= ?", @desk.id, Date.today )
    @appointment_passed = Appointment.where("desk_id = ? AND start_at < ?", @desk.id, Date.today )
    data= Level.find_by(name: @desk.level).svg
    data.gsub!("&lt;", "<")
    data.gsub!("&gt;", ">")
    data.gsub!("&#39;", "'")
    data.gsub!(";", "")
    @levelSvg = data.html_safe
  end



  private

  def desk_params
    params.require(:desk).permit(:name, :level, :description)
  end

  def loadingSvglevel
    if params[:level].present?
      level =  params[:level]
      @levelSvg = Level.find_by(name: level)
      @levelSvg = @levelSvg.svg
     end
  end

  def generateJsonDesk(desks, start_at, level)
    puts desks
    puts "--------"
    puts start_at
    puts "--------"
    puts level
    data = []
    desks.each do |desk|
      current_time = Time.now
      time_rails = current_time.strftime("%Y-%m-%d %H:%M:%S UTC")
   #récupération des paramètres, si il y en a
      if start_at
        date_start = Date.parse(start_at)
      else
        date_start =  time_rails
      end
# recherche des dispos
      desk_id = Desk.where(name: desk.name)
      desk_id = desk_id[(level.to_i - 1) || 0];
      booked = Appointment.where("? = start_at AND desk_id = ?", date_start, desk_id).exists?
# on remplit le tableau si il y a des créneaux ou non de trouvé
      if booked
        data << {id: desk.id, name: desk.name, level: desk.level, dispo: false}
      else
        data << {id: desk.id, name: desk.name, level: desk.level, dispo: true}
      end
    end
    return data
  end
end
