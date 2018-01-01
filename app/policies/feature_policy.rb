class FeaturePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
    #user.admin? || @features.first.command.user_id == user.id
  end

  def create?
    true
  end

  def show?
    true
  end
end
