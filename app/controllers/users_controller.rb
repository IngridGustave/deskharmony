class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @desks = Desk.all
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @appointment = Appointment.new
    @desks = Desk.where(user: params[:id])
    @desk = Desk.new
    @desks = Desk.all
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :job_title, :nickname)
  end
end
