Rails.application.routes.draw do
  resources :top_stories, only: %i[index]

  root to: 'top_stories#index'
end
