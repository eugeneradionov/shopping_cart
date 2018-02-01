require 'rails_helper'

module ShoppingCart
  RSpec.describe CartsController, type: :controller do
    routes { ShoppingCart::Engine.routes }
    let(:cart) { FactoryBot.create(:cart) }

    describe 'GET #show' do
      it 'returns a success response' do
        get :show, params: { id: cart.to_param }
        expect(response).to be_success
      end

      it 'renders :show template' do
        get :show
        expect(response).to render_template :show
      end
    end

    describe 'POST #update' do
      it 'sets coupon to params' do
        expect(controller).to receive(:set_coupon_to_params)
        post :update
      end
    end
  end
end
