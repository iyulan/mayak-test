# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Wildberries::ProductPageService) do
  describe "#call" do
    let(:search_phrase) { Faker::Lorem.sentence }
    let(:page) { 1 }
    let(:url) { "#{Wildberries::BaseService.base_uri}/api/search/results?page=1&search=#{search_phrase}" }
    let(:product_ids) { [1, 2, 3] }
    let(:page_size) { 10 }
    let(:total_pages) { 100 }
    let(:response) do
      {
        data: {
          products: product_ids,
          pager: {
            pageSize: page_size,
            totalPages: total_pages,
          },
        },
      }
    end

    subject { described_class.new(search_phrase: search_phrase, page: page).call }

    before do
      stub_request(:get, url).to_return(status: 200, body: response.to_json)
    end

    it "should request products" do
      subject
      expect(WebMock).to(have_requested(:get, url))
    end

    it "should return parsed data" do
      expect(subject).to(eq([product_ids, page_size, total_pages]))
    end
  end
end
