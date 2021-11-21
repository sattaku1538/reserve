class Public::OrdersController < ApplicationController

  before_action :name_set, only:[:new,:confirm]

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def new
    @order = Order.new
    @shippings = current_customer.shippings.all
    @address = "〒#{current_customer.post_code}" + current_customer.address
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @postage = 800
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @payment_method = params[:order][:payment_method]

    # 住所選択で分岐(0:メインの住所,1:登録済みの住所,2:新規住所)
    case params[:order][:select_shipping]
    when "0" then
      @order = Order.new(order_params)
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.address_name = @name
    when "1" then
      @shipping = Shipping.find(params[:order][:address_id])
      @order = Order.new(order_params)
      @order.post_code = @shipping.post_code
      @order.address = @shipping.address
      @order.address_name = @shipping.name
    when "2" then
      @order = Order.new(order_params)
    end

  end

  def create
    # 入力された内容をorderに保存
    @order = current_customer.orders.new(order_params)

    if @order.save
      # カートの商品をorder_detailに保存
      @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_detail = @order.order_details.new
        @order_detail.product_id = cart_item.product_id
        @order_detail.price = cart_item.product.tax_in_price
        @order_detail.quantity = cart_item.quantity
        @order_detail.save
      end
      redirect_to public_orders_complete_path
    else
      render 'confirm'
    end
  end

  def complete
  end

  private

  def order_params
      params.require(:order).permit(:post_code, :address, :address_name, :payment_method)
  end

  def name_set
    @name = current_customer.last_name + current_customer.first_name
  end

end
