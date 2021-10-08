# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Wildberries::ProductInfoService) do
  describe "#call" do
    let(:product_id) { Faker::Number.number(digits: 7) }
    let(:url) { "#{Wildberries::BaseService.base_uri}/api/catalog/#{product_id}/detail.aspx" }
    let(:phrase) { Faker::Lorem.sentence }
    let(:rank) { 1 }
    let(:date) { Time.current }
    let(:search_info) do
      {
        phrase: phrase,
        rank: rank,
        date: date,
      }
    end
    let(:brand_id) { Faker::Number.number(digits: 4) }
    let(:brand_name) { Faker::Lorem.word }
    let(:name) { Faker::Lorem.word }
    let(:response) do
      {
        data: {
          productInfo: {
            brandId: brand_id,
            brandName: brand_name,
            name: name,

          },
        },
      }
    end

    subject { described_class.new(product_id: product_id, search_info: search_info).call }

    before do
      stub_request(:get, url).to_return(status: 200, body: response.to_json)
    end

    it "should request product info" do
      subject
      expect(WebMock).to(have_requested(:get, url))
    end

    context "when product exists" do
      let(:product_brand) { create(:product_brand, brand_id: brand_id) }

      before { create(:product, product_id: product_id, product_brand: product_brand) }

      it "should not create product" do
        expect { subject }.not_to(change(Product, :count))
      end

      it "should not create product brand" do
        expect { subject }.not_to(change(ProductBrand, :count))
      end
    end

    context "when product not exists" do
      it "should create product" do
        expect { subject }.to(change(Product, :count).to(1))
      end

      it "should create product" do
        expect { subject }.to(change(ProductBrand, :count).to(1))
      end

      it "should create product rank" do
        expect { subject }.to(change(ProductRank, :count).to(1))
      end
    end
  end
end
