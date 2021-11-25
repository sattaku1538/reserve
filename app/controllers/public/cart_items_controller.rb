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

    cart_item = current_customer.cart_items.find_by(product_id: @cart_item.product_id)
    
    # ↓↓佐藤追記（UnlessとReturnはすごい。動作内容個数がゼロの状態でカートに入れるを実行→エラーのデバック）
    unless @cart_item.quantity
      redirect_back(fallback_location: public_cart_items_path)
      return
    end
    
    # ↓↓松井記述
    # カート内に同じ商品が存在したらtrue
    if cart_item.present?
        # カートに入れた個数を足してquantityを更新
        cart_item.quantity += @cart_item.quantity.to_i
        # 更新した内容を保存する
        cart_item.save
        redirect_to public_cart_items_path
        flash[:notice] = "カートに商品を追加しました！"
        
    elsif @cart_item.save
        redirect_to public_cart_items_path
        flash[:notice] = "カートに商品を追加しました！"
        
    else
        render 'public/products/show'
    end
  end

  def update
    @item.update(cart_item_params)
    redirect_back(fallback_location: public_cart_items_path)
    flash[:notice] = "商品の個数を変更しました！"
  end

  def destroy
    @item.destroy
    redirect_back(fallback_location: public_cart_items_path)
    flash[:notice] = "商品を削除しました。"
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_back(fallback_location: public_cart_items_path)
    flash[:notice] = "カートの商品をすべて削除しました。"
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
      redirect_to new_customer_session_path
    end
  end
end
