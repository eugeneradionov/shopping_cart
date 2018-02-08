FactoryBot.define do
  factory :order_status, class: 'ShoppingCart::OrderStatus' do
    status FFaker::Lorem.phrase
  end
end