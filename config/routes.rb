# frozen_string_literal: true

Rails.application.routes.draw do
  resources :top_stories, only: %i[index] do
    resources :relevant_comments, only: %i[index], constraints: { format: 'js' }
  end

  root to: 'top_stories#index'
end
