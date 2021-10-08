# frozen_string_literal: true

module Wildberries
  class ProductPageInfoWorker
    include Sidekiq::Worker

    def perform(search_phrase, page)
      product_ids, page_size, total_pages = Wildberries::ProductPageService.new(search_phrase: search_phrase,
        page: page).call

      return if total_pages < page

      product_ids.each.with_index do |product_id, index|
        rank = (page - 1) * page_size + index + 1
        Wildberries::ProductWorker.perform_async(product_id, search_phrase, rank, Time.current)
      end
    end
  end
end
