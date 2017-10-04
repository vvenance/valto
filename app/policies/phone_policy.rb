class PhonePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def update?
    true
  end

  def create?
    true
  end
end
