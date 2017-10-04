class AdminPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      User.all
    end
  end

  def index?
    User.all
    true
  end

  def command?
    true
  end

  def show?
    true
  end
end
