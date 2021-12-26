Rails.application.routes.draw do
  resources :comments
  resources :followships
  resources :shops
  resources :deliveries

  resources :s_orders do
    post :is_shipped, on: :member
    post :is_delivered, on: :member
  end

  resources :orders do
    post :is_completed, on: :member
    post :is_cancelled, on: :member
  end

  resources :favorites

  resources :carts do
    post :inc_one, on: :member
    post :dec_one, on: :member
  end

  resources :products

  devise_for :users
  
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
