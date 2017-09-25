class CreateUserInterfaces < ActiveRecord::Migration[5.1]
  def change
    create_table :user_interfaces do |t|

      t.timestamps
    end
  end
end
