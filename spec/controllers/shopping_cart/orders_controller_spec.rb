require 'rails_helper'

module ShoppingCart
  RSpec.describe OrdersController, type: :controller do
    routes { ShoppingCart::Engine.routes }

    before do
      @user = FactoryBot.create(:user)
      @cart = FactoryBot.create(:cart)
      @delivery = FactoryBot.create(:delivery)
      @shipping_address = FactoryBot.create(:shipping_address)
      @billing_address = FactoryBot.create(:billing_address)
      @payment = FactoryBot.create(:payment)
      @order_status = FactoryBot.create(:order_status)

      sign_in @user
    end

    let(:valid_attributes) do
      { delivery_id: @delivery.id, cart_id: @cart.id,
        user_id: @user.id, payment_id: @payment.id,
        shipping_address_id: @shipping_address.id,
        billing_address_id: @billing_address.id,
        order_status_id: @order_status.id }
    end

    describe 'GET #index' do
      it 'returns a success response' do
        Order.create! valid_attributes
        get :index
        expect(response).to be_success
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        order = Order.create! valid_attributes
        get :show, params: { id: order.to_param }
        expect(response).to be_success
      end
    end
  end
end
