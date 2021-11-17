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
    	@customer = current_ustomer
	end

	def is_deleted
    	@customer = current_ustomer
    	@customer.update(is_deleted: false)
    	reset_session
    	redirect_to root_path
	end

	private

# 	def params

#    end

end
