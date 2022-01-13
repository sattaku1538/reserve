Rails.application.routes.draw do
    root to: 'homes#top'
    get 'homes/about'
  namespace :admin do
    root to: 'orders#index'
    resources :products, only:[:index, :new, :create, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update] do
      resources :order_details, only:[:update]
    end
    resources :categories, only:[:index, :create, :edit, :update]
    get 'customers/order_index' => 'customers#order_index'
    resources :customers, only:[:index, :show, :edit, :update]
    get 'searches/search' => 'searches#search'
  end
  namespace :public do

    # 注文確認画面のルーティング
    post 'confirm/orders' => 'orders#confirm', as: 'orders_confirm'

    # 注文完了画面のルーティング
    get 'orders/complete' => 'orders#complete'
    resources :orders, only:[:index,:show,:new,:create]

    get 'products/search' => 'products#search'
    get 'products/search_category' => 'products#search_category'
    resources :products, only:[:index,:show]
    resources :cart_items, only:[:index,:create,:update,:destroy]

    resources :shippings, only:[:index, :create, :edit, :update, :destroy]

    # カート内商品の全削除
    delete 'cart_items' => 'cart_items#destroy_all'

    # カスタマーズのリソース佐藤Update リソースは基本のindex等しか入っていないので、withdrawは別個で入れる必要が
    resource :customers, only:[:show, :edit, :update]
    get 'customers/unsubscribe'
    patch 'customers/withdraw'

  end
  
  # ログイン、新規登録後の画面変移に関する
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
