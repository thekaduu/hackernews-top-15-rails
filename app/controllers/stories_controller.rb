class StoriesController < ApplicationController
  def index
    @stories = SearchStories.call(query_params)
  end

  private

  def query_params
    params.permit(:query)[:query] || ''
  end
end
