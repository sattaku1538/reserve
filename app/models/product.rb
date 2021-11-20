class Product < ApplicationRecord
  # アソシエーション
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  belongs_to :category
  
  validates :name, presence: true
  validates :discription, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :image, presence: true
  
  # refileを使用して商品画像をアップする
  attachment :image
  
  # 商品の税込み価格算出(小数点切り捨て)
  def tax_in_price
    (price*1.1).floor
  end
end
