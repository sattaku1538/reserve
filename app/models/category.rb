class Category < ApplicationRecord
  # アソシエーション
  has_many :products
end
