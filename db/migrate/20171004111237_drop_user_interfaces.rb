class DropUserInterfaces < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_interfaces
  end
end
