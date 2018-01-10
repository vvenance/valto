class CommandPolicy < ApplicationPolicy
  attr_reader :user, :scope

  class Scope < Scope

    def initialize(user, command)
      @user = user
      @command = command
    end

    def resolve
      if user.admin?
        @command.all
      else
        @command.where(user_id: user.id)
      end
    end
  end

  def create?
    user.admin?
  end
end
