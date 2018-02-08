module ShoppingCart
  class ApplicationController < ::ActionController::Base
    protect_from_forgery with: :exception
    include ShoppingCart::CurrentCart
    before_action :set_cart
  end
end
