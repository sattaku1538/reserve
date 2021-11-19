class Public::CustomersController < ApplicationController

    before_action :set_customer

    def set_customer
    @customer = current_customer
    end

    def show
	end

	def edit
	end

	def update
	   if @customer.update(customer_params)
	  	redirect_to public_customer_path
	  	# フラッシュメッセージいれる？notice: "You have updated your account successfully."
	    else
	     render "edit"
      end
    end

	def unsubscribe
    end

	def withdraw
    	@customer.update(is_deleted: true)
    	reset_session
    	redirect_to public_root_path
	end

	private

	def customer_params
		params.require(:customer).permit(:email, :first_name, :last_name, :first_name_ruby, :last_name_ruby, :post_code, :address, :telephone_number)
    end

end
