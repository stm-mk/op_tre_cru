FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "title-#{n}" }
    sequence(:description) { |n| "body-#{n}" }
    association :user
  end
end