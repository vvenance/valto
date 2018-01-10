class ContractPolicy < ApplicationPolicy
  attr_reader :user, :scope

  def initialize(user, contract)
    @user = user
    @contract = contract
  end

  class Scope < Scope

    def resolve
      if user.admin?
        @contract.all
      else
        @contract.where(user_id: user.id)
      end
    end

  end

  def show?
    is_admin? || user_own_contract?
  end

  def create?
    true
  end

  def update?
    true
  end

  private

  def user_own_contract?
    # TO DO refacto nesting args
    @contract.command.user_id == user.id
  end

  def is_admin?
    user.admin?
  end


end
