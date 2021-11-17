# frozen_string_literal: true

class Public:customer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  #退会後ログイン阻止
  before_action :reject_inacrive_current_customer, only: [:create]

  def reject_inactive_customer
    @customer = current_ustomer
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && !@customer.is_deleted
        redirect_to new_user_session_path
      end
    end
  end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
