class Product < ApplicationRecord
  # アソシエーション
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  belongs_to :category
  
  # refileを使用して商品画像をアップする
  attachment :image
  
end
