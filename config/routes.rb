Rails.application.routes.draw do
  get 'carts/show'

  get 'carts/complete'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'tests/index'

  get 'tests/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
