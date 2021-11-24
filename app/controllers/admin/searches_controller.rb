class Admin::SearchesController <  Admin::ApplicationController

  def search
    @model = params[:model]
    @keyword = params[:keyword]
    keyword = "%#{@keyword}%"

    # セレクトボックスで選んだ内容で分岐
    case @model
    when 'product' then
      # 商品名か説明に検索ワードが含まれる商品を取得
      @products = Product.search_for(@keyword).page(params[:page])
    when 'order' then
      # 検索ワードが含まれる商品のidを取得
      @products = Product.where("name LIKE ?", keyword).pluck(:id)
      # その商品を注文している注文のidを取得
      @order_details = OrderDetail.where(product_id: @products).pluck(:order_id)
      @orders = Order.where(id: @order_details).page(params[:page]).reverse_order
    when 'customer' then
      # 名もしくは姓に検索ワードが含まれる顧客を取得
      @customers = Customer.where(['last_name LIKE? OR first_name LIKE? OR last_name || first_name LIKE?', keyword, keyword, keyword]).page(params[:page]).reverse_order
    end

  end

end
