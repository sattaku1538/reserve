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
	   # なかじさん　Viewページの作成をお願いします。？
	end
	
	def withdraw
	   # なかじさん
	end


	private

# 	def params
  	
    end
    
end
