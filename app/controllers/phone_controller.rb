class PhoneController < ApplicationController
  def update
    id = params['id']
    phone = Phone.find(id)
    authorize(phone)
    phone.called = true
    phone.save
    redirect_to admin_index_path
  end

  private

  def phone_params
    params.permit(:format)
  end
end
