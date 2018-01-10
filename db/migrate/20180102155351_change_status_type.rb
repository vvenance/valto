class ChangeStatusType < ActiveRecord::Migration[5.1]
  def change
    change_column(:estimates, :status, :string)
  end
end
