class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @phone = Phone.new
    authorize @phone
    @phones = policy_scope(Phone)
    authorize @phones
  end

  def create
    phone = Phone.new
    authorize phone
    if params["/"][:number].match(/(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/)
      phone.number = params["/"][:number]
      phone.called = false
      if phone.save
        flash[:notice] = "Nous vous rappellerons dans les plus brefs délais."
      else
        flash[:alert] = "Quelque chose s'est mal passé. Merci de réessayer."
      end
    else
      flash[:alert] = "Ce numéro n'est pas valable. Merci d'essayer à nouveau."
    end
    redirect_to root_path
  end

  private

  def phone_params
    params.permit(["/home"])
  end
end
