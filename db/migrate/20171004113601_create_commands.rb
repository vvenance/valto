class CreateCommands < ActiveRecord::Migration[5.1]
  def change
    create_table :commands do |t|
      t.string :name
      t.boolean :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
