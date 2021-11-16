class Public::CartItemsController < ApplicationController
  
  before_action :set_item
  
  def index
    @cart_items = current_customer.cart_items.all
    @items = Products.find(@cart_items.product_id)
    # カート内商品の合計金額を算出
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to public_cart_items_path
  end
  
  def update
    @item.update(cart_item_params)
    redirect_back(fallback_location: public_cart_items_path)
  end
  
  def destroy
    @item.destroy
    redirect_back(fallback_location: public_cart_items_path)
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_back(fallback_location: public_cart_items_path)
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:product_id,:quanitity)
  end
  
  def set_item
    @item = CartItem.find(params[:id])
  end
end
