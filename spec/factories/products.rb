FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "testing#{n}" }
    association :brand, factory: :brand
    cost_price 10
    selling_price 100
    stock 100
  end

  trait :invalid do
    name nil
  end
end
