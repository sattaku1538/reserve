class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :discription, null: false
      t.string :image_id, null: false
      t.integer :category_id, null: false
      t.boolean :is_sold, default: true, null: false
      t.integer :price, null: false

      t.timestamps
    end
    add_foreign_key :products, :categories
  end
end
