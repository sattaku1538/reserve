class Admin::ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update]
  
  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :discription, :image, :price, :is_sold, :category_id)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end
end
