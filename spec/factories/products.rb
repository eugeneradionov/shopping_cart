FactoryBot.define do
  factory :product do
    title { FFaker::Lorem.phrase}
    price 12.55
  end
end
