class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.boolean :status
      t.string :invoice_file
      t.references :command, foreign_key: true

      t.timestamps
    end
  end
end
