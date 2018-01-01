class InvoiceDataSirenIntegerToBigint < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoice_data, :siren
    add_column :invoice_data, :siren, :bigint
  end
end
