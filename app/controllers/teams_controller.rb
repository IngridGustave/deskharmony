class TeamsController < ApplicationController
  def index
    @desks = Desk.all
    @team_users = User.joins(:team_users).where(team_users: { team_id: current_user.team_users.pluck(:team_id) })
    @chatroom = Chatroom.find_by(name: "1")
    @message = Message.new
    #@user = User.find(current_user.id)
  end
end
