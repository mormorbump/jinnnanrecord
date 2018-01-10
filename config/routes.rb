Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users,only: [:show,:edit]
  resources :items,only: [:index,:show]
  resources :carts,only: [:show]
  post 'add_item' => 'carts#add_item'
  patch 'update_item' => 'carts#update_item'
  delete 'delete_item/:item_id' => 'carts#delete_item',as: 'delete_item'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
