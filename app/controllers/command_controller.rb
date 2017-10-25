class CommandController < ApplicationController
  def new
    @command = Command.new
  end

  def create
    command_params
    command = Command.new
    command.name = params[:name]
    command.status = false
    command.user_id = params[:id]
    command.save
    # blou
    redirect_to admin_command_path(id: params[:id])
  end

  private

  def command_params
    params.permit(:user_id, :name)
  end
end
