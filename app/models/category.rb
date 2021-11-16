class Category < ApplicationRecord
  # アソシエーション
  has_many :products
  
  # 同じジャンル名は弾く
  validates :name, presence: true, uniqueness: true
end
