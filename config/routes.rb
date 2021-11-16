Rails.application.routes.draw do
  namespace :admin do
    resources :products, only:[:index, :new, :create, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]
    resources :categories, only:[:index, :create, :edit, :update]
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
