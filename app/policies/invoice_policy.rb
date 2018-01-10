class InvoicePolicy < ApplicationPolicy
  attr_reader :user, :scope

  class Scope < Scope

    def initialize(user, invoice)
      @user = user
      @invoice = invoice
    end

    def resolve
      if user.admin?
        @invoice.all
      else
        @invoice.where(user_id: user.id)
      end
    end
  end

  def create?
    true
  end

  def update?
    true
  end
end
