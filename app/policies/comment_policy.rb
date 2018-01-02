class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      Comment.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end
end
