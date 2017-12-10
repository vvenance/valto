class AdminController < ApplicationController
  def show
    @phones = Phone.all
    @users = User.where(admin: false)
  end

  def command
    admin_params
    id = params[:id]
    @user = User.where(id: id).first
    @commands = Command.where(user_id: id)
    @command = Command.new
  end

  private

  def admin_params
    params.permit(:id)
  end

  layout "application"
end
