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

    # カート内に同じ商品があった場合は個数(quantity)だけ変更する
    # カート内に同じ商品が存在したらtrue
    if current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id]).present?
        # 該当商品と一致するカート内の商品を変数に格納
        cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
        # カートに入れた個数足してquantityを更新
        cart_item.quantity += params[:cart_item][:quantity].to_i
        # 更新した内容を保存する
        cart_item.save
        redirect_back(fallback_location: public_cart_items_path)
    elsif @cart_item.save
        redirect_back(fallback_location: public_cart_items_path)
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
end
