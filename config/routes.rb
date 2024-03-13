Rails.application.routes.draw do
  
    # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}


# 「devise_scope」メソッドは、Deviseが提供するセッション関連の機能をカスタマイズ
devise_scope :admin do
  get '/admin/sign_out' => 'devise/sessions#destroy'
end

  
  #namespace :admin doはルーティングをグループ化するための機能
  namespace :admin do
    # get 'orders/show'
    resources :orders,only: [:show, :update]
    resources :order_details,only: [:update]
    
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
    resources :customers, only: [:index, :show, :edit, :update]
    
    # get 'production_areas/index'
    # get 'production_areas/edit'
    resources :production_areas, only: [:index, :show,:create, :edit, :update]
    
    # get 'items/index'
    # get 'items/new'
    # get 'items/edit'
    # get 'items/show'
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    
    # get 'homes/top'
    root to: 'homes#top'
  end
  
  namespace :public, path: '/' do
    # get 'addresses/index'
    # get 'addresses/edit'
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    
    # get 'cart_items/index'
    delete 'cart_items/destroy_all', as:'destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    
    # get 'customers/show'
    # get 'customers/edit'
    get 'customers/unsubscribe'
    resources :customers, only: [:show, :edit, :update]
    
    get 'items/index'
    get 'items/show'
    resources :items, only: [:index, :show]
    
    root to: 'homes#top'
    # get 'homes/top'
    get 'homes/about'
    
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
