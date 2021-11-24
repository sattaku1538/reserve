class Public::ProductsController < ApplicationController
  def index
    @products = Product.where(is_sold: true).page(params[:page]).per(8)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
    @cart_item = CartItem.new
  end
  
  def search
    @keyword = params[:keyword]
    @products = Product.search_for(@keyword)
  end

  def search_category
    @categories = Category.all
    @products = Product.where(category_id: params[:id]).page(params[:page]).per(8)
    @category_name = params[:name]
  end
end
