class Public::ProductsController < ApplicationController

  before_action :set_category

  def index
    @products = Product.where(is_sold: true).page(params[:page]).per(8)
    @header_name = "商品一覧"
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def search
    @keyword = params[:keyword]
    @products = Product.search_for(@keyword).page(params[:page]).per(8)
    @header_name = "”#{@keyword}” の検索結果"
    render 'index'
  end

  def search_category
    @products = Product.where(category_id: params[:id]).where(is_sold: true).page(params[:page]).per(8)
    @category_name = params[:name]
    @header_name = "#{@category_name} 一覧"
    render 'index'
  end

  def set_category
    @categories = Category.all
  end

end
