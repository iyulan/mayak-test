# frozen_string_literal: true

module Wildberries
  class ProductWorker
    include Sidekiq::Worker

    def perform(product_id, search_phrase, rank, date)
      Wildberries::ProductInfoService.new(product_id: product_id,
        search_info: { phrase: search_phrase, rank: rank, date: date }).call
    end
  end
end
