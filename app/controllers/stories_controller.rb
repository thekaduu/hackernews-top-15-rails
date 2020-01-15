class StoriesController < ApplicationController
  def index
    FetchStoriesJob.perform_later(query_params)
  end

  private

  def query_params
    params.permit(:query)[:query] || ''
  end
end
