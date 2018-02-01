FactoryBot.define do
  factory :cart, class: 'ShoppingCart::Cart' do
    user_id 1
    discount 9.99
  end
end
