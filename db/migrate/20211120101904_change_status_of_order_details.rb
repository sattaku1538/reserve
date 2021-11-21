class ChangeStatusOfOrderDetails < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :orderdetails, :status, :integer, default: '0'
    end

    def down
      change_column :orderdetails, :status, :integer
    end
  end
end
