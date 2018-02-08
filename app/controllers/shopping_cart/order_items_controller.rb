require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class OrderItemsController < ApplicationController
    before_action :set_order_item, only: [:update, :destroy]

    # POST /order_items
    def create
      product_id = params[:product_id]
      quantity = params[:order_item] ? params[:order_item][:quantity] : 1
      @order_item = @cart.add_product(product_id, quantity)

      respond_to do |format|
        if @order_item.save
          format.html { redirect_to(request.referrer || root_path)}
          format.js
        else
          format.html { redirect_to(request.referrer || root_path) }
          format.js
        end
      end
    end

    # PUT /order_items/1
    def update
      quantity = order_item_params[:quantity]

      case quantity
      when 'inc'
        @order_item.quantity += 1
      when 'dec'
        @order_item.quantity -= 1
      else
        @order_item.quantity = quantity
      end

      @order_item.save

      respond_to do |format|
        format.html { redirect_to(request.referrer || root_path) }
        format.js { render 'cart_summary' }
      end
    end

    # DELETE /order_items/1
    # DELETE /order_items/1.json
    def destroy
      @order_item.destroy
      respond_to do |format|
        format.html { redirect_to cart_path, notice: 'Order item was successfully destroyed.' }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :quantity)
    end
  end
end
