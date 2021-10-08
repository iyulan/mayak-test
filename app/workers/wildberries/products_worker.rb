# frozen_string_literal: true

module Wildberries
  class ProductsWorker
    include Sidekiq::Worker

    def perform
      Product::SEARCH_PHRASES.each do |phrase|
        (1..Product::PAGE_LIMIT).each do |page|
          Wildberries::ProductPageInfoWorker.perform_async(phrase, page)
        end
      end
    end
  end
end
