# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :marketplace, :product_id

  belongs_to :product_brand
  has_many :product_ranks
end
