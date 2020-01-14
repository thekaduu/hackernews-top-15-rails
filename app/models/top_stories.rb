# frozen_string_literal: true

class TopStories
  attr_reader :query

  def initialize(query = nil)
    @query = query
  end

  def self.call(query = nil)
    new(query).call
  end

  def call
    StoriesFactory.call(gateway.top_stories)
  end

  private

  def gateway
    @gateway ||= StoryGateway.new
  end
end
