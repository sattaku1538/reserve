class Public::ProductsController < ApplicationController

  before_action :set_category

  def index
    @products = Product.where(is_sold: true).page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def search
    @keyword = params[:keyword]
    @products = Product.search_for(@keyword).page(params[:page]).per(8)
  end

  def search_category
    @products = Product.where(category_id: params[:id]).page(params[:page]).per(8)
    @category_name = params[:name]
  end

  def set_category
    @categories = Category.all
  end

end
