class Public::HomesController < ApplicationController
  def top
   @products = Product.all.order(created_at: :DESC)
    @categories = Category.all
  end
  
  def about
  end
end
