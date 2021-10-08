# frozen_string_literal: true

class ProductBrand < ApplicationRecord
  has_many :products, dependent: :destroy
end
