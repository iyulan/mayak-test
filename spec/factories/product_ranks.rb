# frozen_string_literal: true

FactoryBot.define do
  factory :product_rank do
    search_phrase { Faker::Lorem.sentence }
    rank { Faker::Number.number(digits: 2) }
    seach_date { Time.current }

    association :product
  end
end
