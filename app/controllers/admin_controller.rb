class AdminController < ApplicationController
  def index
    @phones = Phone.all
    @users = User.where(admin: false)
    @new_user = User.new
  end

  def command
    admin_params
    id = params[:id]
    @user = User.where(id: id).first
    @commands = Command.where(user_id: id)
    @command = Command.new
    @invoice_data = InvoiceDatum.where(user_id: id).first
    @new_invoice_data = InvoiceDatum.new
  end

  def create_user
    user = User.new
    user.email = params["user"]["email"]
    user.password = params["user"]["password"]
    user.save
  end

  private

  def admin_params
    params.permit(:id)
  end


end


