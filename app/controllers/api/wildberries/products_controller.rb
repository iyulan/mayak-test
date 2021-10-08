# frozen_string_literal: true

module Api
  module Wildberries
    class ProductsController < ApplicationController
      def show
        product = Product.wildberries.find_by_product_id(params[:id])

        render(json: product)
      end
    end
  end
end
