class PhoneController < ApplicationController
  def update
    id = params[:format]
    phone = Phone.find(id)
    authorize(phone)
    phone.called = true
    phone.save
    redirect_to admin_show_path
  end

  private

  def phone_params
    params.permit(:format)
  end
end
