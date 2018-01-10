Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :items,only: [:index,:show]
  resources :users,only: [:show,:edit]
  resources :carts,only: [:show,:edit] do
    post :add_item, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
