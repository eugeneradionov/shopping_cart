require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class CartsController < ApplicationController
    # authorize_resource
    # GET /cart
    def show
    end

    # POST /cart
    def update
      set_coupon_to_params

      respond_to do |format|
        if @cart.update(cart_params)
          format.html { redirect_to cart_path, notice: 'Book was successfully updated.' }
        else
          format.html { redirect_to cart_path, notice: '' }
        end
      end
    end

    private

    def set_coupon_to_params
      coupon = Coupon.find_by(code: params[:cart][:discount])
      if coupon&.active
        params[:cart][:discount] = coupon.discount
        coupon.active = false
        coupon.save
      else
        params[:cart][:discount] = nil
      end
    end

    def cart_params
      params.fetch(:cart, {}).permit(:discount)
    end
  end
end
