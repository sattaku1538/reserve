class Public::ProductsController < ApplicationController
  def index
    @products = Product.where(is_sold: true)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
    @cart_item = CartItem.new
  end
end
