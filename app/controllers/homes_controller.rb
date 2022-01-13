class HomesController < ApplicationController
  def top
    @products = Product.all.order(created_at: :DESC).limit(4)
    @categories = Category.all
  end
  
  def about
  end
end
