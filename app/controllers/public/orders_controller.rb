class Public::OrdersController < ApplicationController
  
  before_action :set_item_from_cart only: [:confirm,:create]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @addresses = current_customer.shippings.all
  end

  def confirm
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
    @order = current_customer.orders.new(order_params)
    @order.save
    @order_items.save
    redirect_to public_orders_complete_path
  end
  
  def complete
  end
  
  private
  
  def order_params
      params.require(:order).permit(:post_code, :address, :address_name, :payment_method)
  end

end
