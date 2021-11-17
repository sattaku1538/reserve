class Public::HomesController < ApplicationController
  def top
    @products = Product.all.order(created_at: :DESC)
  end
  
  def about
  end
end
