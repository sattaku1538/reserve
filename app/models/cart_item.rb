class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  
  # カート内商品の小計算出
  def sum_of_price
    product.tax_in_price * quanitity
  end
end
