class CommandController < ApplicationController

  def index
    @commands = policy_scope(Command)
    @new_command = Command.new
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
    authorize command
    command.save
    # TO DO add error gestion if command is not updated
    # display alert on redirect
    redirect_to admin_command_path(id: params["/command"]["user_id"]) if current_user.admin?
    redirect_to command_index_path unless current_user.admin?
  end

  private

  def command_params
    params.permit(:user_id, :name)
  end
end
