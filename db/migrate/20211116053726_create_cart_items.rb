class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
