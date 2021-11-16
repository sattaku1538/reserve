class Public::ProductsController < ApplicationController
  def index
    @products = Products.where(is_sold: true)
    @categories = Categories.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end
end
