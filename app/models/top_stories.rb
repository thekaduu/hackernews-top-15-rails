# frozen_string_literal: true

class TopStories
  attr_reader :query, :repository, :stories

  def initialize(query = nil)
    @query = query
  end

  def self.call(query = nil)
    new(query).call
  end

  def call
    StoriesFactory.call(repository.top_stories)
  end

  private

  def repository
    @repository ||= StoryRepository.new
  end
end
