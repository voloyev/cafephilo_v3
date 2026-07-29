# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  root to: 'events#index'
  resources :events, only: %i[index show]
  resources :about, only: :index
  resources :contacts, only: :index
  resources :email_subscriptions, only: %i[create show destroy], param: :uuid

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/weblium/webhook', to: 'weblium#webhook'
    end
  end
end
