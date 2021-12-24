Rails.application.routes.draw do
  resources :s_orders
  resources :orders
  resources :favorites
  resources :carts
  resources :products
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
