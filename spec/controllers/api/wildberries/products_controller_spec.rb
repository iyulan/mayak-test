# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Api::Wildberries::ProductsController, type: :controller) do
  describe "GET #show" do
    let(:product) { create(:product) }

    before do
      create_list(:product_rank, 3, product: product)
      get :show, params: { id: product.product_id }
    end

    it "should be success" do
      expect(response.status).to(eq(200))
    end

    it "should return product json" do
      expect(json_body).to(match_response_schema("product"))
    end
  end
end
