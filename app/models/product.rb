# frozen_string_literal: true

class Product < ApplicationRecord
  SEARCH_PHRASES = [
    "macbook",
    "сумка женская",
    "платье",
    "футболка женская",
    "колесо",
    "телевизор",
  ].freeze
  PAGE_LIMIT = 2

  enum marketplace: [:wildberries, :aliexpress]

  belongs_to :product_brand
  has_many :product_ranks, dependent: :destroy
end
