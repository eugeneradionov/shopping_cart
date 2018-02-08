FactoryBot.define do
  factory :delivery, class: 'ShoppingCart::Delivery' do
    add_attribute :method, 'qweqwe'
    price 10.10
    days_from 1
    days_to 2
  end
end
