module ShoppingCart::CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    if session[:cart_id]
      @cart = ShoppingCart::Cart.find(session[:cart_id])
    else
      @cart = ShoppingCart::Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
