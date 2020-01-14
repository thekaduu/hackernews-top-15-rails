# frozen_string_literal: true

class TopStoriesController < ApplicationController
  def index
    @stories = TopStories.call
  end
end
