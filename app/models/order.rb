class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  validates :customer_id, :address,:address_name, :postage, :total_price, :payment_method, presence: true
	validates :post_code, length: {is: 7}, numericality: { only_integer: true }
	validates :postage, :total_price, numericality: { only_integer: true }

  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { ready: 0, confirm: 1, making: 2, preparation_shipping: 3, finish: 4 }
end
