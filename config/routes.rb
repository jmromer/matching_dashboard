# frozen_string_literal: true

Rails.application.routes.draw do
  resources :home, only: :index

  namespace :api, defaults: { format: :json } do
    resources :home, only: %i[index]
    resources :pairings, only: %i[create]
  end

  root to: "home#index"
end
