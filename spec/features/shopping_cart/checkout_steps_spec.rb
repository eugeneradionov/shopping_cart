require 'rails_helper'

RSpec.describe 'Checkout', type: :feature do
  before(:each) do
    FactoryBot.create(:delivery)
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    login_as(@user, scope: :user)

    @user.cart = ShoppingCart::Cart.create(user_id: @user.id)
    ShoppingCart::OrderItem.create(product_id: @product.id, cart_id: @user.cart.id)
    in_progress = FactoryBot.create(:order_status, status: 'In Progress')
    FactoryBot.create(:order_status, status: 'Waiting for Processing')

    @order = ShoppingCart::Order.create(user: @user, order_status: in_progress,
                          aasm_state: 'address')
  end

  feature 'Address step' do
    before(:each) do
      visit shopping_cart.checkout_path

      find_field('checkout[billing_first_name]').set(FFaker::Name.first_name)
      find_field('checkout[billing_last_name]').set(FFaker::Name.last_name)
      find_field('checkout[billing_address]').set(FFaker::Address.street_address)
      find_field('checkout[billing_city]').set(FFaker::Address.city)
      find_field('checkout[billing_zip]').set(FFaker::AddressUS.zip_code)
      find_field('checkout[billing_country]').find(:xpath, 'option[2]').select_option
      find_field('checkout[billing_phone]').set('+380 11 132 12 12')
    end

    context 'Do not use billing address checkbox' do
      scenario 'Filling in Billing and Shipping Addresses' do

        find_field('checkout[shipping_first_name]').set(FFaker::Name.first_name)
        find_field('checkout[shipping_last_name]').set(FFaker::Name.last_name)
        find_field('checkout[shipping_address]').set(FFaker::Address.street_address)
        find_field('checkout[shipping_city]').set(FFaker::Address.city)
        find_field('checkout[shipping_zip]').set(FFaker::AddressUS.zip_code)
        find_field('checkout[shipping_country]').find(:xpath, 'option[2]').select_option
        find_field('checkout[shipping_phone]').set('+380 11 132 12 12')

        click_button('Save and Continue')
        expect(page).to have_css('.radio')
      end
    end

    context 'Use billing address checkbox' do
      scenario 'Filling in only Billing Address' do
        first(:css, '#checkout_use_billing_address', visible: false).set(true)

        click_button('Save and Continue')
        expect(page).to have_css('.radio')
      end
    end
  end

  feature 'Delivery step' do
    scenario 'Choose delivery method' do
      shipping_address = FactoryBot.create(:shipping_address)
      billing_address = FactoryBot.create(:billing_address)
      @order.update(billing_address: billing_address,
                    shipping_address: shipping_address, aasm_state: 'delivery')
      visit shopping_cart.checkout_path

      first('.radio-input', visible: false).set(true)
      click_button('Save and Continue')
      expect(page).to have_css('#cardNumber')
    end
  end

  feature 'Payment step' do
    scenario 'Filling in Payment info' do
      shipping_address = FactoryBot.create(:shipping_address)
      billing_address = FactoryBot.create(:billing_address)
      delivery = ShoppingCart::Delivery.first
      @order.update(billing_address: billing_address,
                    shipping_address: shipping_address, delivery: delivery,
                    aasm_state: 'payment')
      visit shopping_cart.checkout_path

      find_field('checkout[card_number]').set('1234123412341234')
      find_field('checkout[name_on_card]').set('Name on Card')
      find_field('checkout[mm_yy]').set('12/12')
      find_field('checkout[cvv]').set('123')
      click_button('Save and Continue')

      expect(page).to have_css('.general-edit')
    end
  end

  feature 'Confirm step' do
    scenario 'Placing Order' do
      shipping_address = FactoryBot.create(:shipping_address)
      billing_address = FactoryBot.create(:billing_address)
      delivery = ShoppingCart::Delivery.first
      payment = FactoryBot.create(:payment)
      @order.update(billing_address: billing_address,
                    shipping_address: shipping_address, delivery: delivery,
                    aasm_state: 'confirm', payment: payment)

      visit shopping_cart.checkout_path

      click_button('Place Order')

      expect(page).to have_content('Thank You for your Order!')
    end
  end
end
