FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "testing name #{n}"}
  end
end
