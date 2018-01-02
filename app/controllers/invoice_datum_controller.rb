class InvoiceDatumController < ApplicationController
  def show
    @invoice_datum = InvoiceDatum.find(params[:id])
    authorize @invoice_datum
  end

  def update
    invoice_data = InvoiceDatum.find(params["id"])
    invoice_data.compagny_name = params["invoice_datum"]["compagny_name"]
    invoice_data.adress = params["invoice_datum"]["adress"]
    invoice_data.number = params["invoice_datum"]["number"]
    invoice_data.siren = params["invoice_datum"]["siren"]
    authorize invoice_data
    invoice_data.save!
    redirect_to admin_command_path(id: params["invoice_datum"]["user_id"])
  end

  def create
    invoice_data = InvoiceDatum.new
    invoice_data.compagny_name = params["invoice_datum"]["compagny_name"]
    invoice_data.adress = params["invoice_datum"]["adress"]
    invoice_data.number = params["invoice_datum"]["number"]
    invoice_data.siren = params["invoice_datum"]["siren"]
    invoice_data.user_id = params["invoice_datum"]["user_id"]
    authorize invoice_data
    invoice_data.save
    redirect_to admin_command_path(id: params["invoice_datum"]["user_id"])
  end
end
