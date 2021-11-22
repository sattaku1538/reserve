class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shippings, dependent: :destroy
  
  validates :first_name, :last_name, :first_name_ruby, :last_name_ruby, :telephone_number, :email, presence: true
  validates :post_code, length: {is: 7}, numericality: { only_integer: true }
  validates :telephone_number, numericality: { only_integer: true }
  validates :first_name_ruby, :last_name_ruby,  format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "カタカナで入力して下さい。"}

  
  # 退会機能
  # def active_for_authentication?
  #   super && (self.is_deleted == false)
  # end
  
  
end
