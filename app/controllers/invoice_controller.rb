class InvoiceController < ApplicationController
  def index
    # TO DO refacto policy to accept command_id in params for scope resolving
    test = policy_scope(Invoice)
    @invoices = Invoice.where(command_id: params["id"])
    if current_user.admin?
      @new_invoice = Invoice.new
    end
    @command = Command.find(params[:id])
  end

  def create
    invoice = Invoice.new
    invoice.status = params["invoice"]["status"]
    invoice.invoice_file = params["invoice"]["invoice_file"]
    invoice.command_id = params["invoice"]["command_id"]
    authorize invoice
    invoice.save
    redirect_to invoice_index_path(id: invoice.command_id)
  end

  def update
    invoice = Invoice.find(params["id"])
    invoice.status = params["invoice"]["status"]
    invoice.invoice_file = params["invoice"]["invoice_file"]
    authorize invoice
    invoice.save
    redirect_to invoice_index_path(id: invoice.command_id)
  end
end
