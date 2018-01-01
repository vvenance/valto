class InvoiceDatumController < ApplicationController
  def show
    @invoice_datum = InvoiceDatum.find(params[:id])
    authorize @invoice_datum
  end

  def update
  end

  def create
  end
end
