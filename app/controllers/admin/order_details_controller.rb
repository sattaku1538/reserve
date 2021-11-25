class Admin::OrderDetailsController < Admin::ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)

    order_details = OrderDetail.where(order_id: params[:order_id])
    order = order_detail.order
    if order_details.where(making_status: "making")
      order.status = "making"
      order.save
    end
    if order_details.where(making_status: "finish").count == order_details.count
      order.status = "preparation_shipping"
      order.save
    end

    redirect_to admin_order_path(params[:order_id])
    flash[:notice] = "ステータスを変更しました！"
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
