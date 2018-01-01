class InvoiceDatumPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      InvoiceDatum.all
    end
  end

  def show?
    true
  end
end
