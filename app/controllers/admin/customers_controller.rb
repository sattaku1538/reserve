class Admin::CustomersController < Admin::ApplicationController

  before_action :set_customer, only:[:show,:edit,:update]

  def index
    @customers = Customer.all.page(params[:page]).reverse_order
  end

  def show
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  def order_index
    @orders = Order.where(customer_id: params[:id]).page(params[:page]).reverse_order
  end

  private

  def customer_params
    params.require(:customer).permit(:is_deleted, :first_name, :last_name, :first_name_ruby, :last_name_ruby, :email, :post_code, :address, :telephone_number, :encrypted_password )
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
