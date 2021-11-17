class Public::CustomersController < ApplicationController

    # before_action :authenticate_customer, except: [:？？？？？？？？]

    def show

	end

	def edit

	end

	def update

    end

	   # なかじさん　Viewページの作成をお願いします。？
	def unsubscribe
    	@customer = Customer.find_by(name: params[:name])
	end

	def withdraw
    	@customer = Customer.find_by(name: params[:name])
    	@customer.update(is_valid: false)
    	reset_session
    	redirect_to root_path
	end

	private

# 	def params

#    end

end
