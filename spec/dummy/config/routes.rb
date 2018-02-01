Rails.application.routes.draw do
  devise_for :users
  mount ShoppingCart::Engine => '/cart'
  root 'products#index'

  resources :products, only: %i[index show]

  get 'catalog', to: 'products#index'
end
