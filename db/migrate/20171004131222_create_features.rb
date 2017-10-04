class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.string :feature_file
      t.boolean :status
      t.string :name
      t.string :description
      t.references :command, foreign_key: true

      t.timestamps
    end
  end
end
