class CreateEstimates < ActiveRecord::Migration[5.1]
  def change
    create_table :estimates do |t|
      t.boolean :status
      t.string :estimate_file
      t.references :command, foreign_key: true

      t.timestamps
    end
  end
end
