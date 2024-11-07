Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  get 'products/search', to: 'products#search'
  get 'home/about'
  get 'categories/index'
  get 'coupons/apply', to: 'coupons#apply'
  resources :checkout
  post 'checkout/create', to: 'checkout#create' 
  resources :categories, only: [:index] do
    resources :products, only: [:index]
  end
  resources :products do
    resources :comments
  end
  get "/cart", to: 'order_items#index'
  resources :order_items, path: 'cart/items'
  resources :comments
  #root to: 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
