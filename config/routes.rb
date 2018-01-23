Rails.application.routes.draw do
  root 'items#index'

  devise_for :users, :controllers => {
 :registrations => 'users/registrations'
 # :sessions => 'users/sessions'
}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users,only: [:new,:show,:edit,:update]
  get 'users/:user_id/orderlists' => 'users#orderlists',as: 'orderlists_user'
  get 'users/:id/retire' => 'users#retire',as: 'retire_answer'

  resources :items,only: [:index,:show] do
    resource :reviews,only: [:create,:destroy]
  end

  resources :orders,only: [:new,:create]
  get 'orders/confirm' => 'orders#confirm', as: 'confirm_orders'

  resources :carts,only: [:show]
  post 'add_item' => 'carts#add_item'
  patch 'update_item' => 'carts#update_item',as: 'update_item'
  delete 'delete_item/:item_id' => 'carts#delete_item',as: 'delete_item'
  delete 'delete_all/:cart_id' => 'carts#delete_all',as: 'delete_all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
