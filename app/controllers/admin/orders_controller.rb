class Admin::OrdersController < Admin::ApplicationController
  before_action :set_order, only: %i[show update]

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
  end

  def update
    @order.update(order_params)
    if @order.status == "confirm"
      @order.order_details.each do |order_detail|
        order_detail.making_status = "ready"
        order_detail.save
      end
    end
    redirect_to admin_order_path(@order)
    flash[:notice] = "ステータスを変更しました！"
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
