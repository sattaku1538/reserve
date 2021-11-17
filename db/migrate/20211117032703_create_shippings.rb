class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :customer_id, foreign_key: true
      t.string :address, null: false
      t.string :address_name, null: false
      t.string :post_code, null: false

      t.timestamps, null: false
    end
  end
end
