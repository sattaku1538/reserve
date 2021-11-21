class ChangeStatusOfOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :status, default: 0
  end
end
