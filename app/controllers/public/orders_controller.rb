class Public::OrdersController < ApplicationController

  before_action :set_name, only:[:new,:confirm]
  before_action :set_item, only:[:new,:confirm,:create]
  before_action :set_price, only:[:confirm,:create]

  def index
    @orders = current_customer.orders.all.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def new
    if @cart_items.empty?
      redirect_to public_cart_items_path
      flash[:notice] = "カートに商品が入っていません。"
    end
    @order = Order.new
    @shippings = current_customer.shippings.all
    @address = "〒 #{current_customer.post_code}  #{current_customer.address}"
  end

  def confirm
    # パラメータから選択された支払方法を取得
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
      @order.address_name = @shipping.address_name
    when "2" then
      @order = Order.new(order_params)
      # 入力が一つでも欠けていたら新規注文画面に戻る
      if @order.post_code.blank? or @order.address.blank? or @order.address_name.blank?
        redirect_to new_public_order_path
        flash[:notice]="※入力が空白の項目があります※"
      end
    end
  end

  def create
    # 請求金額-送料=0ならカートへリダイレクト（ブラウザバック対応）
    if @amount_billed == @postage
      redirect_to public_cart_items_path
      flash[:notice] = "商品がありません。"
      return
    end

    # 入力された内容をorderに保存
    @order = current_customer.orders.new(order_params)
    @order.postage = @postage
    @order.total_price = @amount_billed
    @order.status = 0

    if @order.save
      # カートの商品をorder_detailに保存
      @cart_items.each_with_index do |cart_item, i|
        @order_detail = @order.order_details.new
        @order_detail.product_id = cart_item.product_id
        @order_detail.price = cart_item.product.tax_in_price
        @order_detail.quantity = cart_item.quantity
        @order_detail.making_status = 0
        @order_detail.save
        # 最後の処理でカート内商品全削除
        if i == @cart_items.size - 1
          @cart_items.destroy_all
        end
      end
      redirect_to public_orders_complete_path
    else
      #失敗したら新規注文画面に戻る
      redirect_to new_public_order_path
    end
  end

  def complete
  end

  private

  def order_params
      params.require(:order).permit(:post_code, :address, :address_name, :payment_method)
  end

  def set_name
    @name = current_customer.full_name
  end

  def set_item
    @cart_items = current_customer.cart_items.all
  end

  def set_price
    @postage = 800
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @amount_billed = @postage + @total_price
  end

end
