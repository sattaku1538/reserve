class Shipping < ApplicationRecord
  belongs_to :customer
  
  # 注文情報入力で郵便番号、住所、を繋げて表示する
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
    
end
