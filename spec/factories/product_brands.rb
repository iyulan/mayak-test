# frozen_string_literal: true

FactoryBot.define do
  factory :product_brand do
    name { Faker::Lorem.word }
    brand_id { Faker::Number.number(digits: 4) }
  end
end
