class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @addresses = current_customer.shippings.all
  end

  def confirm
    @cart_items = current_user.cart_items.all
    # 住所選択で分岐(0:メインの住所,1:登録済みの住所,2:新規住所) 
    if select_address == 0
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif select_address == 1
      @address = Shipping.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
    elsif select_address == 2
      @order = Order.new(order_params)
    end
  end
  
  def create
    # 入力された内容をorderに保存
    @order = current_customer.orders.new(order_params)
    @order.save
    # カートの商品をorder_detailに保存
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_item = @order.order_details.new
      @order_item.product_id = cart_item.product_id
      @order_item.price = cart_item.product.tax_in_price
      @order_item.quantity = cart_item.quantity
      @order_item.save
    end 
    redirect_to public_orders_complete_path
  end
  
  def complete
  end
  
  private
  
  def order_params
      params.require(:order).permit(:post_code, :address, :address_name, :payment_method)
  end

end
