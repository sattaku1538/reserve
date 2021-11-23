class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

<<<<<<< HEAD
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_ruby, :last_name_ruby, :email, :post_code, :address, :telephone_number, :password])
=======
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:first_name_ruby,:last_name_ruby,:post_code,:address,:telephone_number,:is_deleted])
>>>>>>> 1afabcec4f1aa2b1160b264f890d87c6ca11153a
  end
end
