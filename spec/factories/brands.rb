FactoryBot.define do
  factory :brand do
    sequence(:name) { |n| "testing#{n}" }
  end
end
