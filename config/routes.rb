ShoppingCart::Engine.routes.draw do
  resources :order_items, only: %i[create update destroy]
  resources :orders, only: %i[show index]

  root to: 'carts#show'

  get 'cart', to: 'carts#show'
  post 'cart', to: 'carts#update'

  post 'checkout', to: 'checkout#create'
  post 'checkouts', to: 'checkout#create'
  get 'checkout/login', to: 'checkout_registration#login'
  post 'checkout/sign_up', to: 'checkout_registration#sign_up'
  get 'checkout', to: 'checkout#new'
end
