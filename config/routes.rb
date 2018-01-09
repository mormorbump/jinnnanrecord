Rails.application.routes.draw do
  get 'orders/new'

  get 'orders/create'

  get 'items/index'

  get 'tests/index'

  get 'tests/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
