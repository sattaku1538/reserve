class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  
  enum making_status: { default: 0, ready: 1, making: 2, finish: 3 }
end
