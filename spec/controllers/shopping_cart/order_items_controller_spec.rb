require 'rails_helper'

module ShoppingCart
  RSpec.describe OrderItemsController, type: :controller do
    routes { ShoppingCart::Engine.routes }

    before(:each) do
      @product = FactoryBot.create(:product)
      @cart = FactoryBot.create(:cart)
    end

    let(:valid_attributes) do
      { product_id: @product.id,
        cart_id: @cart.id }
    end

    describe 'POST #create' do
      it 'creates a new OrderItem' do
        expect do
          post :create, params: valid_attributes
        end.to change(OrderItem, :count).by(1)
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested order_item' do
        order_item = OrderItem.create! valid_attributes
        expect do
          delete :destroy, params: { id: order_item.to_param }
        end.to change(OrderItem, :count).by(-1)
      end

      it 'redirects to the order_items list' do
        order_item = OrderItem.create! valid_attributes
        delete :destroy, params: { id: order_item.to_param }
        expect(response).to redirect_to(cart_path)
      end
    end
  end
end
