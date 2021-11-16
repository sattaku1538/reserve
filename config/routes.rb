Rails.application.routes.draw do
  namespace :admin do
    root to: 'orders#index'
    resources :products, only:[:index, :new, :create, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]
    resources :categories, only:[:index, :create, :edit, :update]
  end
  namespace :public do
    root to: 'homes#top'
    get 'homes/about'
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'products/index'
    get 'products/show'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
