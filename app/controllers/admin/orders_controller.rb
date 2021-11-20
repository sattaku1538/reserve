class Admin::OrdersController < Admin::ApplicationController
  before_action :set_order, only: %i[show update]
  
  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
  end
  
  def update
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end
  
  def set_order
    @order = Order.find(params[:id])
  end
end
