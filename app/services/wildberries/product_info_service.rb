# frozen_string_literal: true

module Wildberries
  class ProductInfoService < BaseService
    def initialize(product_id:, search_info:)
      super()
      @product_id = product_id
      @search_info = search_info
    end

    def call
      response = self.class.get("/api/catalog/#{product_id}/detail.aspx")

      product_info = JSON.parse(response.body).dig("data", "productInfo")

      product_brand = ProductBrand.where(brand_id: product_info["brandId"])
        .first_or_create(name: product_info["brandName"])
      product = product_brand.products.wildberries.where(product_id: product_id)
        .first_or_create(name: product_info["name"])
      product.product_ranks.create(search_phrase: search_info[:phrase], rank: search_info[:rank],
        seach_date: search_info[:date])
    end

    private

    attr_reader :product_id, :search_info
  end
end
