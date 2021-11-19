class Public::CartItemsController < ApplicationController

  before_action :set_item, only:[:update,:destroy]
  before_action :signed_in?

  def index
    @cart_items = current_customer.cart_items.all
    # カート内商品の合計金額を算出
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)

    cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
    # カート内に同じ商品が存在したらtrue
    if cart_item.present?
        # カートに入れた個数を足してquantityを更新
        cart_item.quantity += params[:cart_item][:quantity].to_i
        # 更新した内容を保存する
        cart_item.save
        redirect_to public_cart_items_path
    elsif @cart_item.save
        redirect_to public_cart_items_path
    else
        render 'public/products/show'
    end
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
    params.require(:cart_item).permit(:product_id,:quantity)
  end

  def set_item
    @item = CartItem.find(params[:id])
  end

  def signed_in?
    unless customer_signed_in?
      # flash[:notice] = "ログインしてください"
      redirect_to new_customer_session_path
    end
  end
end
