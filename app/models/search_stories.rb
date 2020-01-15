# frozen_string_literal: true

class SearchStories
  attr_reader :query

  def initialize(query = '')
    @query = query
  end

  def self.call(query = '')
    new(query).call
  end

  def call
    collection = if query.blank?
                   gateway.top_stories
                 else
                   gateway.search_stories(query)
                 end

    StoriesFactory.call(collection)
  end

  private

  def gateway
    @gateway ||= StoryGateway.new
  end
end
