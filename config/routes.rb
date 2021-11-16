Rails.application.routes.draw do
  namespace :admin do
    root to: 'orders#index'
    resources :products, only:[:index, :new, :create, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update] do
      resources :order_details, only:[:update]
    end
    resources :categories, only:[:index, :create, :edit, :update]
  end
  namespace :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :orders, only:[:index,:show,:new,:create]
    
    # 注文確認画面のルーティング
    post 'orders/confirm' => 'orders#confirm'
    
    # 注文完了画面のルーティング
    get 'orders/complete' => 'orders#complete'
    
    resources :products, only:[:index,:show]
    resources :cart_items, only:[:index,:create,:update,:destroy]
    resources :shippings, only:[:index, :create, :edit, :update, :destroy]
    
    # カート内商品の全削除
    delete 'cart_items' => 'cart_items#destroy_all'
    
    # カスタマーズのリソース佐藤Update リソースは基本のindex等しか入っていないので、withdrawは別個で入れる必要が
    resources :customers, only[:show, :edit, :update]
    get 'customers/unsubscribe'
    get 'customers/withdraw'
    
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
