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
    command.name = params["/command"]["name"]
    command.user_id = params["/command"]["user_id"]
    command.status = false
    command.save
    authorize command
    redirect_to admin_command_path(id: params["/command"]["user_id"])
  end

  private

  def command_params
    params.permit(:user_id, :name)
  end
end
