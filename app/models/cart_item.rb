class CartItem < ApplicationRecord
    
    
  # カート内商品の小計算出
  def sum_of_price
    product.tax_in_price * quanitity
  end
end
