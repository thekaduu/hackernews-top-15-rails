# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :stories, only: %[index] do
    resources :relevant_comments, only: %i[index], constraints: { format: 'js' }
  end

  root to: 'stories#index'
end
