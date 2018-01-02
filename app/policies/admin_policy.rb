class AdminPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      User.all
    end
  end

  def index?
    true
  end

  def command?
    true
  end

  def show?
    true
  end

  def create_user?
    user.admin?
  end
end
