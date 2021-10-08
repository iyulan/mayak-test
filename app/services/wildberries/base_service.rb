# frozen_string_literal: true

module Wildberries
  class BaseService
    include HTTParty

    base_uri "https://napi.wildberries.ru"
  end
end
