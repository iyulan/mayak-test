# frozen_string_literal: true

module Wildberries
  class ProductPageService < BaseService
    def initialize(search_phrase:, page:)
      super()
      @search_phrase = search_phrase
      @page = page
    end

    def call
      response = self.class.get("/api/search/results", query: { search: search_phrase, page: 1 })

      product_ids = JSON.parse(response.body).dig("data", "products")
      page_info = JSON.parse(response.body).dig("data", "pager")

      [product_ids, page_info["pageSize"], page_info["totalPages"]]
    end

    private

    attr_reader :search_phrase, :page
  end
end
