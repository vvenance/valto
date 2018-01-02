class CommandPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      Command.all
    end
  end

  def create?
    true
  end
end
