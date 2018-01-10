class InvoiceDatumPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      InvoiceDatum.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end
end
