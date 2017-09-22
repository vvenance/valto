class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @phone = Phone.new
    authorize @phone
    @phones = policy_scope(Phone)
  end

  def create
    phone = Phone.new
    authorize phone
    if params["/"][:number].match(/(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/)
      phone.number = params["/"][:number]
      phone.called = false
      if phone.save
        flash[:notice] = t('controllers.home.we_call_you_back')
      else
        flash[:alert] = t.('controllers.home.smth_went_wrong_try_again')
      end
    else
      flash[:alert] = t.('controllers.home.not_valid_nbr_try_again')
    end
    redirect_to root_path
  end

  private

  def phone_params
    params.permit(["/home"])
  end
end
