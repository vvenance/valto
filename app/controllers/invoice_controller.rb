class InvoiceController < ApplicationController
  def index
    test = policy_scope(Invoice)
    @invoices = Invoice.where(command_id: params[:id])
    @new_invoice = Invoice.new
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
