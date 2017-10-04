class CreateInvoiceData < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_data do |t|
      t.string :compagny_name
      t.integer :siren
      t.string :adress
      t.integer :number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
