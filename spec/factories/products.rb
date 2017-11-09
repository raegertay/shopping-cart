FactoryBot.define do
  factory :product do
    name 'test'
    association :brand, factory: :brand
    cost_price 10
    selling_price 100
    stock 100
  end
end
