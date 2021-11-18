class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { ready: 0, confirm: 1, making: 2, preparation_shipping: 3, finish: 4 }
end
