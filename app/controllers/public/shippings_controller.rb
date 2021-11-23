class Public::ShippingsController < ApplicationController
  before_action :set_shipping, only: %i[edit update destroy]
  
  def set_shipping
    @shipping = Shipping.find(params[:id])
  end
  
  def index
    @shippings = current_customer.shippings.all
    @shipping = Shipping.new
  end
  
  def create
    @shipping = current_customer.shippings.new(shipping_params)
    if @shipping.save
      redirect_to public_shippings_path
      flash[:notice] =  "配送先を登録しました。"
    else
      @shippings = current_customer.shippings.all
      render 'index'
    end
  end

  def edit
  end
  
  def update
    if @shipping.update(shipping_params)
      redirect_to public_shippings_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @shipping.destroy
    # @shippings = current_customer.shippings
    flash[:notice] =  "配送先を削除しました。"
    redirect_to public_shippings_path
  end
  
  
  private
  
  def shipping_params
    params.require(:shipping).permit(:post_code, :address, :address_name)
  end
end
