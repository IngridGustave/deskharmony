require 'date'

class DesksController < ApplicationController

  def weekcalendar
    @date = Date.parse(params.fetch(:date, Date.today.to_s))+ 1.week
    @appointments_week = Appointment.where(user: current_user).where("DATE(start_at) >= ? AND DATE(start_at) <= ?", @date.all_week.begin, @date.all_week.end)
    respond_to do |format|
      format.html
      format.text { render partial: "desks/week_calendar", locals: {appointments_week: @appointments_week}, formats: [:html] }
    end
  end

  def previousweekcalendar
    @date = Date.parse(params.fetch(:date, Date.today.to_s))- 1.week
    @appointments_week = Appointment.where(user: current_user).where("DATE(start_at) >= ? AND DATE(start_at) <= ?", @date.all_week.begin, @date.all_week.end)
    respond_to do |format|
      format.html
      format.text { render partial: "desks/week_calendar", locals: {appointments_week: @appointments_week}, formats: [:html] }
    end
  end


  def available
    nameDesk = params[:bureau];
    @desk = Desk.find_by(name: nameDesk );
    date = Date.today
    @desk_available =[];
    @appointment= Appointment.new
    @desks = @desk_available

    while @desk_available.size < 4 do
      appointment = Appointment.where(user: current_user).where(desk: @desk).where("DATE(start_at) = ? ", date);
      if !appointment.present?
        @desk_available << date
      end
      date = date + 1
    end

    respond_to do |format|
      format.html
      format.text { render partial: "desks/template_submenu", locals: {desks: @desks, desk: @desk}, formats: [:html] }
    end

  end


  def index

    @teamsusers = User.all
    @desks = Desk.all
    @appointment = Appointment.new
    @chatroom = Chatroom.find_by(name: "1")
    @message = Message.new
    @start_of_last_week = Date.today.prev_week.beginning_of_week
    @end_of_last_week = Date.today.prev_week.end_of_week
    @last_week_dates = @start_of_last_week..@end_of_last_week
    @date = Date.parse(params.fetch(:date, Date.today.to_s))
    @appointments_week = Appointment.where(user: current_user).where("DATE(start_at) >= ? AND DATE(start_at) <= ?", @date.all_week.begin, @date.all_week.end)
    data = []
    start_at = params[:startdate] if params[:startdate].present?
    level = params[:level] if params[:level].present?
    @levelSvg = loadingSvglevel || 1
    data = generateJsonDesk(@desks, start_at, level)

# envoi des données au controller stimulus
    respond_to do |format|
      format.html
      format.json { render json: data }
      format.text { render partial: "desks/svg", locals: {levelSvg: @levelSvg}, formats: [:html] }
    end
  end

  def show
    @desks = Desk.all
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

  def search
    @desks = Desk.all
    @teamsusers = User.all

    if params[:query].present?
      query = params[:query].split(" ").last
      sql_query = "first_name ILIKE :query"
      @users = User.where(sql_query, query: "%#{query}%")
    else
      @users = User.all
    end
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
    dataJson = []
    book_desks = []
    current_time = Time.now.strftime("%Y-%m-%d %H:%M:%S UTC")
    if start_at
      date_start = Date.parse(start_at)
    else
      date_start =  current_time
    end
    search_desks_book = Desk.joins(:appointments).where(appointments: { start_at: date_start })
    search_desks_book .each do |book_desk|
      book_desks << book_desk.id
    end

   if book_desks.empty?
     desks.each do |desk|
         dataJson << {id: desk.id, name: desk.name, level: desk.level, dispo: true}
     end
   else
     desks.each do |desk|
       book_desks.each do |book_desk|
         if desk.id == book_desk
           dataJson << {id: desk.id, name: desk.name, level: desk.level, dispo: false}
         else
           dataJson  << {id: desk.id, name: desk.name, level: desk.level, dispo: true}
         end
       end
      end
   end
    return dataJson
  end
end
