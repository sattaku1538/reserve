class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  # カート内商品の小計算出
  def subtotal
    product.tax_in_price * quantity
  end
end
