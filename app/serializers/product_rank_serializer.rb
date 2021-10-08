# frozen_string_literal: true

class ProductRankSerializer < ActiveModel::Serializer
  attributes :id, :search_phrase, :rank, :seach_date
end
