class CommandController < ApplicationController

  def index

  end

  def show

  end

  def update

  end


  def create
    command_params
    command = Command.new
    command.name = params[:name]
    command.status = false
    command.user_id = params[:id]
    command.save
    redirect_to admin_command_path(id: params[:id])
  end

  private

  def command_params
    params.permit(:user_id, :name)
  end
end
