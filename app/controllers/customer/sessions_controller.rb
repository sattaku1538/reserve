# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # ↓↓退会機能
  # before_action :configure_sign_in_params, only: [:create]

  # 退会後ログイン阻止
  # before_action :reject_inactive_customer, only: [:create]

  # def reject_inactive_customer
  #   @customer = current_customer
  #   if @customer
  #     if @customer.valid_password?(params[:customer][:password]) && !@customer.is_deleted
  #       redirect_to new_customer_session_path
  #     end
  #   end
  # end
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # ↓↓退会機能
  # protected
  # 退会しているかを判断するメソッド
# 　def customer_state
#     ## 【処理内容1】 入力されたemailからアカウントを1件取得
#     @customer = Customer.find_by(email: params[:customer][:email])
#     ## アカウントを取得できなかった場合、このメソッドを終了する
#     return if !@customer
#     ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
#     if @customer.valid_password?(params[:customer][:password])
#       ## 【処理内容3】
#     end
#   end
  

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
