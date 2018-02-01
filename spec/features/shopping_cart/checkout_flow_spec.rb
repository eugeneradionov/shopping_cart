require 'rails_helper'

RSpec.describe 'Checkout', type: :feature do
  feature 'Checkout' do

    scenario 'Checkout flow' do
      FactoryBot.create(:delivery)
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
      login_as(@user, scope: :user)

      @user.cart = ShoppingCart::Cart.create(user_id: @user.id)
      ShoppingCart::OrderItem.create(product_id: @product.id, cart_id: @user.cart.id)
      FactoryBot.create(:order_status, status: 'In Progress')
      FactoryBot.create(:order_status, status: 'Waiting for Processing')
      visit shopping_cart.checkout_path

      find_field('checkout[billing_first_name]').set(FFaker::Name.first_name)
      find_field('checkout[billing_last_name]').set(FFaker::Name.last_name)
      find_field('checkout[billing_address]').set(FFaker::Address.street_address)
      find_field('checkout[billing_city]').set(FFaker::Address.city)
      find_field('checkout[billing_zip]').set(FFaker::AddressUS.zip_code)
      find_field('checkout[billing_country]').find(:xpath, 'option[2]').select_option
      find_field('checkout[billing_phone]').set('+380 11 132 12 12')

      find_field('checkout[shipping_first_name]').set(FFaker::Name.first_name)
      find_field('checkout[shipping_last_name]').set(FFaker::Name.last_name)
      find_field('checkout[shipping_address]').set(FFaker::Address.street_address)
      find_field('checkout[shipping_city]').set(FFaker::Address.city)
      find_field('checkout[shipping_zip]').set(FFaker::AddressUS.zip_code)
      find_field('checkout[shipping_country]').find(:xpath, 'option[2]').select_option
      find_field('checkout[shipping_phone]').set('+380 11 132 12 12')

      click_button('Save and Continue')

      first('.radio-input', visible: false).set(true)
      click_button('Save and Continue')

      find_field('checkout[card_number]').set('1234123412341234')
      find_field('checkout[name_on_card]').set('Name on Card')
      find_field('checkout[mm_yy]').set('12/12')
      find_field('checkout[cvv]').set('123')
      click_button('Save and Continue')

      ShoppingCart::OrderStatus.create(status: 'Waiting for Processing')
      click_button('Place Order')

      expect(page).to have_content('Thank You for your Order!')
    end
  end
end
