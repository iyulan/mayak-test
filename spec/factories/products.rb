# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Lorem.word }
    product_id { Faker::Number.number(digits: 7) }
    marketplace { :wildberries }

    association :product_brand
  end
end
