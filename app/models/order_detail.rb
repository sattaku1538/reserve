class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  
  validates :product_id, :order_id, :quantity, :price, presence: true
	validates :price, :quantity, numericality: { only_integer: true }

  
  enum making_status: { default: 0, ready: 1, making: 2, finish: 3 }
end
