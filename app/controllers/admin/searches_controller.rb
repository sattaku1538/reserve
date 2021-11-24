class Admin::SearchesController <  Admin::ApplicationController

  def search
    @model = params[:model]
    @keyword = params[:keyword]

    case @model
    when 'product' then
      @products = Product.where('name LIKE? OR discription LIKE?', '%'+keyword+'%', '%'+keyword+'%')
    when 'order' then
      @products = Product.where('name LIKE ?', '%'+keyword+'%')
      @orders = Order.order_details.where(product_id: @products.id)
    when 'customer' then
      @customers = Customer.where('name LIKE?', '%'+keyword+'%')
    end
    
  end

end
