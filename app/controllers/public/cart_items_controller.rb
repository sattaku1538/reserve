class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItems.where(customer_id: current_customer.id)
    @items = Products.find(@cart_items.product_id)
    # カート内商品の合計金額を算出
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
  end
  
  def update
    @item = CartItem.find(params[:id])
    @item.update
    redirect_back(fallback_location: public_cart_items_path)
  end
  
  def destroy
    @item = CartItem.find(params[:id]).destroy
    redirect_back(fallback_location: public_cart_items_path)
  end
  
  def destroy_all
    CartItem.where(customer_id: :cuurent_customer.id).destroy_all
    redirect_back(fallback_location: public_cart_items_path)
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:quanitity)
  end
end
