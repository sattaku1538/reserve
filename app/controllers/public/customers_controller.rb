class Public::CustomersController < ApplicationController

    # before_action :authenticate_customer, except: [:？？？？？？？？]

    def show
     @customer = current_customer
	end

	def edit
	 @customer = current_customer	
	end

	def update
	 @customer = current_customer
	  if @customer.update(customer_params)
	  	redirect_to customer_path
	  	# フラッシュメッセージいれる？notice: "You have updated your account successfully."
	    else
	     render "edit"
      end
    end

	def unsubscribe
    	@customer = current_customer
	end

	def is_deleted
    	@customer = current_customer
    	@customer.update(is_deleted: false)
    	reset_session
    	redirect_to root_path
	end

	private

	def customer_params
		params.require(:customer).permit(:email, :first_name, :last_name, :first_name_ruby, :last_name_ruby, :post_code, :address, :telephine_number)
    end

end
