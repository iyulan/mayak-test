# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :wildberries do
      resources :products, only: [:show]
    end
  end
end
