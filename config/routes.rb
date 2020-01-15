# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'

  resources :stories, only: %[index] do
    resources :relevant_comments, only: %i[index], constraints: { format: 'js' }
  end

  root to: 'stories#index'
end
